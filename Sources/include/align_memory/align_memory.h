/**
 * \file align_memory.h
 * \author Kumarjit Das (kumarjitdas1999@gmail.com)
 * \brief Contains all `Align-Memory` library function declarations/prototypes
 *        and their documentations.
 * \version 0.8.0
 * \date 2021-12-10
 *
 * \copyright Copyright (c) 2021
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

#if defined(INT64_MAX) && defined(INT64_MIN)
#ifndef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT
#define KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT
#endif /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT */
#endif /* defined(INT64_MAX) && defined(INT64_MIN) */

// #undef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

#ifdef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

/**
 * \brief Returns the allocation size from the actual and alignment size.
 *
 * \details It calculates and returns the value of
 *     (KDI align-memroy offset size +
 *      alignment size - 1 +
 *      usable memory size)
 * which is the new memory allocation size. The alignment size should be any
 * of these values: 1, 2, 4, 8, 16, 32, 64, or 128.
 *
 * \param u64Usable_size    actual memory size
 * \param u64Alignment_size memory alignment size
 *
 * \return total memory allocation size
 *
 * \warning `u64Usable_size` should be a non-zero value
 * \warning `u64Alignment_size` should be a non-zero value between 1 and 128
 *          (including 1 and 128) and it should be a power of 2
 *
 * \since v0.7.0
 */
uint64_t KDI_ALIGN_MEMORY_API
kdi_get_size_for_memory_alignment(uint64_t u64Usable_size,
                                  uint64_t u64Alignment_size);

/**
 * \brief Returns the aligned memory location.
 *
 * \details If the pointer is already aligned it returns it, otherwise, it
 * returns the aligned pointer after the actual pointer.
 *
 * \param pMemory           actual memory location
 * \param u64Alignment_size memory alignment size
 *
 * \return aligned memory location
 *
 * \warning `pMemory` should be a non-null pointer
 * \warning `u64Alignment_size` value should be a return value of
 *          `kdi_get_size_for_memory_alignment` function
 *
 * \since v0.8.0
 */
void KDI_ALIGN_MEMORY_API*
kdi_get_aligned_memory_forward(void* pMemory,
                               uint64_t u64Alignment_size);

/**
 * \brief Returns the aligned memory location.
 *
 * \details If the pointer is already aligned it returns it, otherwise, it
 * returns the aligned pointer before the actual pointer.
 *
 * \param pMemory           actual memory location
 * \param u64Alignment_size memory alignment size
 *
 * \return aligned memory location
 *
 * \warning `pMemory` should be a non-null pointer
 * \warning `u64Alignment_size` should be a non-zero value between 1 and 128
 *          (including 1 and 128) and it should be a power of 2
 */
void KDI_ALIGN_MEMORY_API*
kdi_get_aligned_memory_backward(void* pMemory,
                                uint64_t u64Alignment_size);

/**
 * \brief Returns the aligned memory location.
 *
 * \details The total allocation size should be calculated using the
 * `kdi_get_size_for_memory_alignment` function and then the memory should
 * be allocated using this size, otherwise, there may be a segmentation fault
 * while reading/writing to the returned aligned memory.
 *
 * \param pMemory           actual memory location
 * \param u64Alignment_size memory alignment size
 *
 * \return aligned memory location
 *
 * \warning `pMemory` should be a non-null pointer
 * \warning `u64Alignment_size` should be a non-zero value between 1 and 128
 *          (including 1 and 128) and it should be a power of 2
 *
 * \since v0.7.0
 */
void KDI_ALIGN_MEMORY_API*
kdi_align_memory(void* pMemory,
                 uint64_t u64Alignment_size);

/**
 * \brief Returns the actual memory location from an aligned memory location.
 *
 * \warning `pMemory` should be a non-null pointer and should be an aligned
 *          location calculated using the `kdi_align_memory` function,
 *          otherwise, the behaviour is undefined.
 *
 * \param pMemory aligned memory location
 *
 * \return the actual memory location
 *
 * \since v0.7.0
 */
void KDI_ALIGN_MEMORY_API*
kdi_get_actual_memory_from_aligned_memory(void* pMemory);

#else  /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT not defined */
#endif /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT */

#endif /* _KDI_ALIGN_MEMORY_H_ */
