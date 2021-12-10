/**
 * @file example-001.c
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief An example for `Align-Memory` library functions.
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
#include <stdlib.h>
#include <stdint.h>

void show_usage(void) {
    printf(
        "Usage: example-001 length align\n"
        "    length - a positive integer\n"
        "    align  - a positive integer between 1 and 128(including) and\n"
        "             it should be a power of 2\n");
}

int main(int argc, char **argv) {
    if (argc < 3) {
        show_usage();
        return EXIT_FAILURE;
    }

    printf("\n Align-Memory library example:\n\n");

    uint32_t uiUsable_length = (uint32_t)strtol(argv[1], NULL, 10);
    uint32_t uiUsable_size = uiUsable_length * sizeof(int32_t);
    uint32_t uiAlignment_size = (uint32_t)strtol(argv[2], NULL, 10);
    uint32_t uiAllocation_size = kdi_get_size_for_memory_alignment(
        uiUsable_size,
        uiAlignment_size);
    int32_t *pArray = malloc(uiAllocation_size);
    if (pArray == NULL) {
        fprintf(stderr, "ERROR: Could not allocate memory!\n");
        return EXIT_FAILURE;
    }
    int32_t *pAligned_array = kdi_align_memory(pArray,
                                               uiAlignment_size);
    int32_t *pActual_array = kdi_get_actual_memory_from_aligned_memory(
        pAligned_array);

    printf(
        " Usable length:         %u\n"
        " Usable size:           %u\n"
        " Alignment size:        %u\n"
        " Allocation size:       %u\n"
        " Array address:         0x%X\n"
        " Aligned array address: 0x%X\n"
        " Actual array address:  0x%X\n",
        uiUsable_length,
        uiUsable_size,
        uiAlignment_size,
        uiAllocation_size,
        (uint32_t)(uintptr_t)pArray,
        (uint32_t)(uintptr_t)pAligned_array,
        (uint32_t)(uintptr_t)pActual_array);

    free(pArray);
    return EXIT_SUCCESS;
}
