# vmware-esxi-6.7-unmap
Scrip for UNMAP datastores with VMFS version 5 (VMFS5)


Usage: esxcli storage vmfs unmap [cmd options]

Description:
  unmap                 Reclaim the space by unmapping free blocks from VMFS Volume

Cmd options:
  -n|--reclaim-unit=<long>
                        Number of VMFS blocks that should be unmapped per iteration.
  -l|--volume-label=<str>
                        The label of the VMFS volume to unmap the free blocks.
  -u|--volume-uuid=<str>
                        The uuid of the VMFS volume to unmap the free blocks.
