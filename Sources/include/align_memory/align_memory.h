/**
 * @file align_memory.h
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief Contains all `Align-Memory` library function declarations.
 * @version 0.7.0
 * @date 2021-12-10
 *
 * @copyright Copyright (c) 2021
 *
 * License(MIT License):
 *
 * Copyright (c) 2021 Kumarjit Das | কুমারজিৎ দাস
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

/**
 * The alignment-offset size is stored at the front of the starting location
 * of the usable memory.
 *
 * Lets say, usable size of the memory is 8 bytes and
 *           alignment size is 4 bytes
 * The memory allocation size will be,
 *     (KDI align-memroy offset size +
 *      alignment size - 1 +
 *      usable memory size)
 * which evaluates to 12 bytes.
 *
 *     actual starting address
 *     of the allocated memory,
 *     which can be freed
 *      |
 *     [ ][ ][ ][ ][ ][ ][ ][ ][ ][ ][  ][  ]
 *      0  1  2  3  4  5  6  7  8  9  10  11  -  indices
 *
 * By considering the above indices also as memory adresses,
 * the usable memory address could be any index between 0 and 3 (including 0
 * and 3). If the usable memory address starts from 2, then the offset size,
 * which is 2, will be stored in 1.
 *
 *     actual starting address
 *     of the allocated memory
 *      /
 *      |  offset size
 *      |  /
 *      |  | starting address of the usable memory
 *      |  |  |
 *     [ ][2][x][x][x][x][x][x][x][x][  ][  ]
 *      0  1  2  3  4  5  6  7  8  9  10  11
 *      \_____|____________________/
 *         |            |
 *       offset   usable memory
 *
 * ** Why subtract 1? It is explained in the developer notes of the
 *    `kdi_get_size_for_memory_alignment` function later in this file.
 * ** More explanations are given in the developer notes of the functions of
 *    this file.
 */

#ifndef _KDI_ALIGN_MEMORY_H_
#define _KDI_ALIGN_MEMORY_H_

#include "align_memory_api.h"
#include "align_memory_version.h"

#include <stdint.h>

/**
 * @brief Returns the allocation size from the actual and alignment size.
 *
 * It calculates and returns the value of
 *     (KDI align-memroy offset size +
 *      alignment size - 1 +
 *      usable memory size)
 * which is the new memory allocation size. The alignment size should be any
 * of these values: 1, 2, 4, 8, 16, 32, 64, or 128.
 *
 * `uiUsable_size` and `uiAlignment_size` should be non-zero values
 *
 * @param uiUsable_size    actual memory size
 * @param uiAlignment_size memory alignment size
 *
 * @return total memory allocation size
 */
uint64_t KDI_ALIGN_MEMORY_API
kdi_get_size_for_memory_alignment(uint64_t uiUsable_size,
                                  uint64_t uiAlignment_size);

/**
 * @brief Returns the aligned memory location.
 *
 * The total allocation size should be calculated using the
 * `kdi_get_size_for_memory_alignment` function and then the memory should
 * be allocated using this size, otherwise, there may be a segmentation fault
 * while reading/writing to the returned aligned memory.
 *
 * `pMemory` should be a non-null pointer
 * `uiAlignment_size` should be a non-zero value
 *
 * @param pMemory          actual memory location
 * @param uiAlignment_size memory alignment size
 *
 * @return aligned memory location
 */
void KDI_ALIGN_MEMORY_API*
kdi_align_memory(void* pMemory,
                 uint64_t uiAlignment_size);

/**
 * @brief Returns the actual memory location from an aligned memory location.
 *
 * The memory location should be an aligned location calculated using the
 * `kdi_align_memory` function, otherwise, the behaviour
 * is undefined.
 *
 * `pMemory` should be a non-null pointer
 *
 * @param pMemory aligned memory location
 *
 * @return the actual memory location
 */
void KDI_ALIGN_MEMORY_API*
kdi_get_actual_memory_from_aligned_memory(void* pMemory);

#endif /* _KDI_ALIGN_MEMORY_H_ */
