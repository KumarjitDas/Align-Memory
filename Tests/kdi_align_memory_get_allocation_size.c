#include "align_memory/align_memory.h"

#include <stdio.h>
#include <stdint.h>
#include <assert.h>

int main()
{
    uint32_t uiAllocation_size;

    uiAllocation_size = kdi_align_memory_get_allocation_size(1, 1);
    assert(uiAllocation_size == 3);

    uiAllocation_size = kdi_align_memory_get_allocation_size(10, 2);
    assert(uiAllocation_size == 13);

    uiAllocation_size = kdi_align_memory_get_allocation_size(100, 4);
    assert(uiAllocation_size == 105);

    uiAllocation_size = kdi_align_memory_get_allocation_size(1000, 8);
    assert(uiAllocation_size == 1009);

    uiAllocation_size = kdi_align_memory_get_allocation_size(10000, 64);
    assert(uiAllocation_size == 10065);

    return 0;
}
