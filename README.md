# vmware-esxi-6.7-unmap
Scrip for UNMAP datastores with VMFS version 5 (VMFS5)


Usage: esxcli storage vmfs unmap [cmd options]
<br>
Description:
<br>
  unmap                 Reclaim the space by unmapping free blocks from VMFS Volume
<br>
<br>Cmd options:
<br>
<br>-n|--reclaim-unit=<long>
<br>
<br>                        Number of VMFS blocks that should be unmapped per iteration.
<br>  -l|--volume-label=<str>
<br>                        The label of the VMFS volume to unmap the free blocks.
<br>  -u|--volume-uuid=<str>
<br>                        The uuid of the VMFS volume to unmap the free blocks.
