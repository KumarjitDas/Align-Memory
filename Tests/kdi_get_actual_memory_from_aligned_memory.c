/**
 * @file kdi_get_actual_memory_from_aligned_memory.c
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief Tests for `kdi_get_actual_memory_from_aligned_memory` function.
 * @version 0.6.0
 * @date 2021-12-08
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
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

int main() {
    uint32_t uiUsable_size, uiAlignment_size, uiAllocation_size;
    uint32_t *pMemory, *pMemory_aligned, *pMemory_actual;

    // Test 1
    uiUsable_size = 10 * sizeof(*pMemory);
    uiAlignment_size = 1;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 2
    uiUsable_size = 10 * sizeof(*pMemory);
    uiAlignment_size = 2;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 3
    uiUsable_size = 10 * sizeof(*pMemory);
    uiAlignment_size = 4;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 4
    uiUsable_size = 10 * sizeof(*pMemory);
    uiAlignment_size = 8;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 5
    uiUsable_size = 100 * sizeof(*pMemory);
    uiAlignment_size = 16;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 6
    uiUsable_size = 100 * sizeof(*pMemory);
    uiAlignment_size = 32;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 7
    uiUsable_size = 100 * sizeof(*pMemory);
    uiAlignment_size = 64;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 8
    uiUsable_size = 1000 * sizeof(*pMemory);
    uiAlignment_size = 128;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    pMemory = malloc(uiAllocation_size);
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_get_actual_memory_from_aligned_memory(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    return EXIT_SUCCESS;
}
