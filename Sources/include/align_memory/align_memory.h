#ifndef _KDI_ALIGN_MEMORY_H_
#define _KDI_ALIGN_MEMORY_H_

#include "align_memory_api.h"
#include "align_memory_version.h"

#include <stdint.h>

uint32_t KDI_ALIGN_MEMORY_API
    kdi_align_memory_get_allocation_size(uint32_t uiActual_size,
                                         uint32_t uiAlignment_size);

void KDI_ALIGN_MEMORY_API *
    kdi_align_memory_get_aligned_address(void * pMemory,
                                         uint32_t uiAlignment_size);

void KDI_ALIGN_MEMORY_API *
    kdi_align_memory_get_actual_address(void * pMemory);

#endif  /* _KDI_ALIGN_MEMORY_H_ */
