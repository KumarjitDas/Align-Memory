/**
 * @file align_memory.h
 * @author Kumarjit Das (kumarjitdas1999@gmail.com)
 * @brief A simple C library for easy memory alignment.
 * @version 0.5.0
 * @date 2021-08-24
 *
 * @copyright Copyright (c) 2021
 */

#ifndef _KDI_ALIGN_MEMORY_H_
#define _KDI_ALIGN_MEMORY_H_

#include "align_memory_api.h"
#include "align_memory_version.h"

#include <stdint.h>

/**
 * @brief Returns the allocation size from the actual and alignment size.
 * The alignment size should be any of these values: 1, 2, 4, 8, 16, 32, 64,
 * or 128.
 *
 * @param uiActual_size    actual memory size
 * @param uiAlignment_size memory alignment size
 * @return total allocation size calculated from the actual and alignment size
 */
uint32_t KDI_ALIGN_MEMORY_API
    kdi_align_memory_get_allocation_size(uint32_t uiActual_size,
                                         uint32_t uiAlignment_size);

/**
 * @brief Returns the aligned memory location.
 * The total allocation size should be calculated using the
 * `kdi_align_memory_get_allocation_size` function and then the memory should
 * be allocated using this size, otherwise, there may be a segmentation fault
 * while reading/writing to the returned aligned memory.
 *
 * @param pMemory          actual memory location
 * @param uiAlignment_size memory alignment size
 * @return aligned memory location
 */
void KDI_ALIGN_MEMORY_API *
    kdi_align_memory_get_aligned_address(void * pMemory,
                                         uint32_t uiAlignment_size);

/**
 * @brief Returns the actual memory location from a aligned memory location.
 * The memory location should be a aligned location calculated using the
 * `kdi_align_memory_get_aligned_address` function, otherwise, the behaviour
 * is undefined.
 *
 * @param pMemory aligned memory location
 * @return actual memory location
 */
void KDI_ALIGN_MEMORY_API *
    kdi_align_memory_get_actual_address(void * pMemory);

#endif  /* _KDI_ALIGN_MEMORY_H_ */
