/**
 * \file kdi_align_memory.c
 * \author Kumarjit Das (kumarjitdas1999@gmail.com)
 * \brief Tests for `kdi_align_memory` function.
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

#include "align_memory/align_memory.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

// #undef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

#ifdef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

int main() {
    uint64_t u64Usable_size, u64Alignment_size, u64Allocation_size;
    uint32_t *p32Memory, *p32Memory_aligned;

    // Test 1
    u64Usable_size = 10 * sizeof(*p32Memory);
    u64Alignment_size = 1;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 2
    u64Usable_size = 10 * sizeof(*p32Memory);
    u64Alignment_size = 2;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 3
    u64Usable_size = 10 * sizeof(*p32Memory);
    u64Alignment_size = 4;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 4
    u64Usable_size = 10 * sizeof(*p32Memory);
    u64Alignment_size = 8;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 5
    u64Usable_size = 100 * sizeof(*p32Memory);
    u64Alignment_size = 16;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 6
    u64Usable_size = 100 * sizeof(*p32Memory);
    u64Alignment_size = 32;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 7
    u64Usable_size = 100 * sizeof(*p32Memory);
    u64Alignment_size = 64;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    // Test 8
    u64Usable_size = 1000 * sizeof(*p32Memory);
    u64Alignment_size = 128;
    u64Allocation_size = kdi_get_size_for_memory_alignment(u64Usable_size,
                                                           u64Alignment_size);
    p32Memory = malloc(u64Allocation_size);
    if (p32Memory == NULL) {
        return EXIT_FAILURE;
    }
    p32Memory_aligned = kdi_align_memory(p32Memory,
                                         u64Alignment_size);
    assert(((uint64_t)p32Memory_aligned % u64Alignment_size) == 0);
    free(p32Memory);

    return EXIT_SUCCESS;
}

#else  /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT not defined */
#endif /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT */
