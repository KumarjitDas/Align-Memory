/**
 * @file align_memory.c
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief Definitions of all the library functions.
 * @version 0.5.0
 * @date 2021-12-01
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

#include "align_memory/align_memory.h"
#include "utility.h"

#include <stdio.h>

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
 *    `kdi_align_memory_get_allocation_size` function later in this file.
 * ** More explanations are given in the developer notes of the functions of
 *    this file.
 */

uint32_t kdi_align_memory_get_allocation_size(uint32_t uiUsable_size,
                                              uint32_t uiAlignment_size) {
    // ** The alignment size(uiAlignment_size) should be always a power of 2
    //    and between 1 and 128 (including 1 and 128)
    // We are getting the memory allocation size by doing
    //     (KDI align-memroy offset size +
    //      alignment size - 1 +
    //      usable memory size)
    // We are subtracting 1 because, we will never need more than that to align
    // a memory address. When we are aligning a memory address by 4 bytes, we
    // will not need more than 3 bytes to do that.
    // The offset size is required to store the offset to the real memory
    // address.
    return ___KDI_ALIGN_MEMORY_OFFSET_SIZE +
           uiAlignment_size - 1 +
           uiUsable_size;
}

void *kdi_align_memory_get_aligned_address(void *pMemory,
                                           uint32_t uiAlignment_size) {
    // We are decrementing alignment size by 1 so that the bitwise-complement
    // of it can be used to extract aligned address from a normal memory
    // address by just doing a bitwise-and operation.
    //
    // ** Another reason of why we are decrementing alignment size, has been
    //    explained before in `kdi_align_memory_get_allocation_size` function.
    --uiAlignment_size;

    uintmax_t umOffset_size = ___KDI_ALIGN_MEMORY_OFFSET_SIZE +
                              uiAlignment_size;
    void *pOffset_memory = (void *)((uintmax_t)pMemory + umOffset_size);

    // We are getting the aligned memory address from the offset memory address
    // by doing a bitwise-and with the bitwise-complement of alignment size.
    // Lets say, a memory address is 0x45(0100-0101), which has 8 bytes of
    //           usable memory, and
    //           alignment size is 0x04(0000-0100)
    // the offset memory address will be 0x49(0100-1001),
    // the alignment size will be 0x03(0000-0011),
    // its bitwise-complement will be 0xFB(1111-1100), and
    // the bitwise-and will give us 0x48(0100-1000), which is a memory address
    // aligned by 4 bytes.
    // This only works when alignment size is a power of 2 and between 1 and
    // 128 (including 1 and 128)
    void *pAligned_memory = (void *)((uintmax_t)pOffset_memory &
                                     ~(uintmax_t)uiAlignment_size);

    // Getting the front address of the aligned memory as a KDI offset pointer
    // to store the offset size in it
    ___kdi_offset_t *pOffset_size_memory = (___kdi_offset_t *)pAligned_memory -
                                           1;
    *pOffset_size_memory = (___kdi_offset_t)((uintmax_t)pAligned_memory -
                                             (uintmax_t)pMemory);
    return pAligned_memory;
}

void *kdi_align_memory_get_actual_address(void *pMemory) {
    // Getting the front address of the aligned memory as a KDI offset pointer
    // to get the offset size from it
    ___kdi_offset_t *pOffset_size_memory = (___kdi_offset_t *)pMemory - 1;
    uintmax_t umOffset_size = (uintmax_t)*pOffset_size_memory;

    return (uint8_t *)pMemory - umOffset_size;
}
