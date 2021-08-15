#include "align_memory/align_memory.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

int main()
{
    uint32_t uiAlignment_size;
    uint32_t * pMemory = NULL;
    uint32_t * pMemory_aligned = NULL;
    uint32_t * pMemory_actual = NULL;

    // Test 1
    uiAlignment_size = 1;
    pMemory = malloc(kdi_align_memory_get_allocation_size(10,
                                                          uiAlignment_size));
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory_get_aligned_address(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_align_memory_get_actual_address(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 2
    uiAlignment_size = 2;
    pMemory = malloc(kdi_align_memory_get_allocation_size(10,
                                                          uiAlignment_size));
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory_get_aligned_address(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_align_memory_get_actual_address(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 3
    uiAlignment_size = 4;
    pMemory = malloc(kdi_align_memory_get_allocation_size(10,
                                                          uiAlignment_size));
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory_get_aligned_address(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_align_memory_get_actual_address(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 4
    uiAlignment_size = 8;
    pMemory = malloc(kdi_align_memory_get_allocation_size(10,
                                                          uiAlignment_size));
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory_get_aligned_address(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_align_memory_get_actual_address(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    // Test 5
    uiAlignment_size = 64;
    pMemory = malloc(kdi_align_memory_get_allocation_size(10,
                                                          uiAlignment_size));
    if (pMemory == NULL) return EXIT_FAILURE;
    pMemory_aligned = kdi_align_memory_get_aligned_address(pMemory,
                                                           uiAlignment_size);
    pMemory_actual = kdi_align_memory_get_actual_address(pMemory_aligned);
    assert(pMemory_actual == pMemory);
    free(pMemory);

    return EXIT_SUCCESS;
}