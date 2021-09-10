# mkid-rfdc-testing
repo for overlays and Jupyter notebooks used to characterize ZCU111 RFDC for MKID readout and development of custom drivers.

## Rebuild the Project
1. Clone the repository `git clone https://github.com/JennySmith888/mkid-rfdc-testing.git`.
2. Edit the variable `ip_dir` in `write_prj.tcl`, setting it to the path to the 2021.1 branch of [mkid_gen3_blocks](https://github.com/MazinLab/mkidgen3_blocks/tree/2021.1) on your local machine.
3. Set the appropriate paths for Vivado 2021.1 `source <path/to/Vivado/install>/settings64.sh`.
4. Run `vivado -source write_prj.tcl`.

## Test the Project on the ZCU111
1. Copy the contents of the `bit` and `py` folders to a ZCU111 running PYNQ V2.6. Run the Jupyter Notebook.
2. Optional: View ILAs in Vivado hardware maanger.
