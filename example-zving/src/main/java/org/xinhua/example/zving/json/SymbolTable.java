/*
 * Copyright 1999-2101 Alibaba Group.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.xinhua.example.zving.json;


public class SymbolTable {

	public static final int DEFAULT_TABLE_SIZE = 128;

	private final Entry[] buckets;

	private final String[] symbols;

	private final char[][] symbols_char;

	private final int indexMask;

	public SymbolTable() {
		this(DEFAULT_TABLE_SIZE);
	}

	public SymbolTable(int tableSize) {
		indexMask = tableSize - 1;
		buckets = new Entry[tableSize];
		symbols = new String[tableSize];
		symbols_char = new char[tableSize][];
	}

	/**
	 * Adds the specified symbol to the symbol table and returns a reference to the unique symbol. If the symbol already
	 * exists, the previous symbol reference is returned instead, in order guarantee that symbol references remain
	 * unique.
	 * 
	 * @param buffer The buffer containing the new symbol.
	 * @param offset The offset into the buffer of the new symbol.
	 * @param len The length of the new symbol in the buffer.
	 */
	public String addSymbol(char[] buffer, int offset, int len, int hash) {
		// int bucket = indexFor(hash, tableSize);
		final int bucket = hash & indexMask;

		String sym = symbols[bucket];

		boolean match = true;

		if (sym != null) {
			if (sym.length() == len) {
				char[] characters = symbols_char[bucket];

				for (int i = 0; i < len; i++) {
					if (buffer[offset + i] != characters[i]) {
						match = false;
						break;
					}
				}

				if (match) {
					return sym;
				}
			} else {
				match = false;
			}
		}

		OUTER: for (Entry entry = buckets[bucket]; entry != null; entry = entry.next) {
			char[] characters = entry.characters;
			if (len == characters.length && hash == entry.hashCode) {
				for (int i = 0; i < len; i++) {
					if (buffer[offset + i] != characters[i]) {
						continue OUTER;
					}
				}
				return entry.symbol;
			}
		}

		Entry entry = new Entry(buffer, offset, len, hash, buckets[bucket]);
		buckets[bucket] = entry; // 并发是处理时会导致缓存丢失，但不影响正确性
		if (match) {
			symbols[bucket] = entry.symbol;
			symbols_char[bucket] = entry.characters;
		}
		return entry.symbol;
	}

	protected static final class Entry {

		public final String symbol;
		public final int hashCode;

		public final char[] characters;

		public Entry next;

		/**
		 * Constructs a new entry from the specified symbol information and next entry reference.
		 */
		public Entry(char[] ch, int offset, int length, int hash, Entry next) {
			characters = new char[length];
			System.arraycopy(ch, offset, characters, 0, length);
			symbol = new String(characters).intern();
			this.next = next;
			hashCode = hash;
		}

	}

}
