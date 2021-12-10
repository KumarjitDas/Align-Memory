/**
 * @file align_memory.c
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief Contains definitions of all the library functions(public).
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
#include "utility.h"

// #undef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

#ifdef KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT

uint64_t kdi_get_size_for_memory_alignment(uint64_t u64Usable_size,
                                           uint64_t u64Alignment_size) {
    return _KDI_ALIGN_MEMORY_OFFSET_SIZE +
           u64Alignment_size - 1 +
           u64Usable_size;
}

void *kdi_get_aligned_memory_forward(void *pMemory,
                                     uint64_t u64Alignment_size) {
    --u64Alignment_size;
    uint64_t u64Offset_size = _KDI_ALIGN_MEMORY_OFFSET_SIZE +
                              u64Alignment_size;
    void *pOffset_memory = (void *)((uint8_t *)pMemory + u64Offset_size);
    void *pAligned_memory = (void *)((uint64_t)pOffset_memory &
                                     ~u64Alignment_size);
    return pAligned_memory;
}

void *kdi_get_aligned_memory_backward(void *pMemory,
                                      uint64_t u64Alignment_size) {
    void *pAligned_memory = kdi_get_aligned_memory_forward(pMemory,
                                                           u64Alignment_size);
    if (pAligned_memory != pMemory) {
        pAligned_memory = (uint8_t *)pAligned_memory - u64Alignment_size;
    }
    return pAligned_memory;
}

void *kdi_align_memory(void *pMemory,
                       uint64_t u64Alignment_size) {
    void *pAligned_memory = kdi_get_aligned_memory_forward(pMemory,
                                                           u64Alignment_size);
    _kdi_offset_t *pOffset_size_memory = (_kdi_offset_t *)pAligned_memory - 1;
    *pOffset_size_memory = (_kdi_offset_t)((uint64_t)pAligned_memory -
                                           (uint64_t)pMemory);
    return pAligned_memory;
}

void *kdi_get_actual_memory_from_aligned_memory(void *pMemory) {
    _kdi_offset_t *pOffset_size_memory = (_kdi_offset_t *)pMemory - 1;
    uint64_t u64Offset_size = (uint64_t)*pOffset_size_memory;
    return (uint8_t *)pMemory - u64Offset_size;
}

#else  /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT not defined */
#endif /* KDI_ALIGN_MEMORY_ARCHITECTURE_64_BIT */
