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

int main() {
    uint32_t uiUsable_size, uiAlignment_size, uiAllocation_size;

    // Test 1
    uiUsable_size = 10;
    uiAlignment_size = 1;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 11);

    // Test 2
    uiUsable_size = 10;
    uiAlignment_size = 2;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 12);

    // Test 3
    uiUsable_size = 10;
    uiAlignment_size = 4;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 14);

    // Test 4
    uiUsable_size = 10;
    uiAlignment_size = 8;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 18);

    // Test 5
    uiUsable_size = 100;
    uiAlignment_size = 16;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 116);

    // Test 6
    uiUsable_size = 100;
    uiAlignment_size = 32;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 132);

    // Test 7
    uiUsable_size = 100;
    uiAlignment_size = 64;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 164);

    // Test 8
    uiUsable_size = 1000;
    uiAlignment_size = 128;
    uiAllocation_size = kdi_get_size_for_memory_alignment(uiUsable_size,
                                                             uiAlignment_size);
    assert(uiAllocation_size == 1128);

    return EXIT_SUCCESS;
}
