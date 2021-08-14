#include "align_memory/align_memory.h"
#include "utility.h"

#include <stdio.h>

uint32_t kdi_align_memory_get_allocation_size(uint32_t uiActual_size,
                                              uint32_t uiAlignment_size)
{
    return --uiAlignment_size + uiActual_size +
           ___KDI_ALIGN_MEMORY_OFFSET_SIZE;
}

void * kdi_align_memory_get_aligned_address(void *   pMemory,
                                            uint32_t uiAlignment_size)
{
    --uiAlignment_size;
    void * pTemporary_memory = pMemory;
    pMemory = (void *) ((uintmax_t) ((uintmax_t) pMemory + uiAlignment_size +
                         ___KDI_ALIGN_MEMORY_OFFSET_SIZE) &
                        ~((uintmax_t) uiAlignment_size));
    *((___kdi_offset_t *) pMemory - 1) = (___kdi_offset_t)
        ((uintmax_t) pMemory - (uintmax_t) pTemporary_memory);
    return pMemory;
}

void * kdi_align_memory_get_actual_address(void * pMemory)
{
    return (void *) ((uint8_t *) pMemory - *((___kdi_offset_t *) pMemory - 1));
}
