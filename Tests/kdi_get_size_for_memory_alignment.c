/**
 * @file kdi_get_size_for_memory_alignment.c
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief Tests for `kdi_get_size_for_memory_alignment` function.
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

#include "align_memory/align_memory.h"

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

// #undef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

#ifdef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

int main() {
    uint64_t u64Usable_size, u64Alignment_size, u64Allocation_size;

    // Test 1
    u64Usable_size = 10;
    u64Alignment_size = 1;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 11);

    // Test 2
    u64Usable_size = 10;
    u64Alignment_size = 2;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 12);

    // Test 3
    u64Usable_size = 10;
    u64Alignment_size = 4;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 14);

    // Test 4
    u64Usable_size = 10;
    u64Alignment_size = 8;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 18);

    // Test 5
    u64Usable_size = 100;
    u64Alignment_size = 16;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 116);

    // Test 6
    u64Usable_size = 100;
    u64Alignment_size = 32;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 132);

    // Test 7
    u64Usable_size = 100;
    u64Alignment_size = 64;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 164);

    // Test 8
    u64Usable_size = 1000;
    u64Alignment_size = 128;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    assert(u64Allocation_size == 1128);

    return EXIT_SUCCESS;
}

#else  /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT not defined */
#endif /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT */
