/**
 * @file example-001.c
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief An example for `Align-Memory` library functions.
 * @version 0.8.0
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

// #undef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

#ifdef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

int main(int argc, char **argv) {
    if (argc < 3) {
        printf(
            "Usage: example-001 length align\n"
            "    length - a positive integer\n"
            "    align  - a positive integer between 1 and 128(including) "
            "and\n"
            "             it should be a power of 2\n");
        return EXIT_FAILURE;
    }

    printf("\n Align-Memory library example:\n\n");

    uint64_t u64Usable_length = strtoull(argv[1], NULL, 10);
    uint64_t u64Usable_size = u64Usable_length * sizeof(int32_t);
    uint64_t u64Alignment_size = strtoull(argv[2], NULL, 10);
    uint64_t u64Allocation_size = kdi_get_size_for_memory_alignment(
        u64Usable_size,
        u64Alignment_size);
    int32_t *p32Array = malloc(u64Allocation_size);
    if (p32Array == NULL) {
        fprintf(stderr, "ERROR: Could not allocate memory!\n");
        return EXIT_FAILURE;
    }
    int32_t *p32Aligned_array = kdi_align_memory(p32Array,
                                                 u64Alignment_size);
    int32_t *p32Actual_array = kdi_get_actual_memory_from_aligned_memory(
        p32Aligned_array);

    printf(
        " Usable length:         %llu\n"
        " Usable size:           %llu\n"
        " Alignment size:        %llu\n"
        " Allocation size:       %llu\n"
        " Array address:         [%p]\n"
        " Aligned array address: [%p]\n"
        " Actual array address:  [%p]\n",
        u64Usable_length,
        u64Usable_size,
        u64Alignment_size,
        u64Allocation_size,
        p32Array,
        p32Aligned_array,
        p32Actual_array);

    free(p32Array);
    return EXIT_SUCCESS;
}

#else  /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT not defined */
#endif /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT */
