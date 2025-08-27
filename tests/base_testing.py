from __future__ import annotations

from pathlib import Path
import papermill as pm
import os
import shutil

import unittest


class BaseNotebookTesting(unittest.TestCase):
    def setUp(self):
        self.output_path = Path("notebook_runs").absolute()
        self.output_path.mkdir(exist_ok=True)
        self.notebook_examples = Path("notebooks").absolute()

    def get_notebook_output_path(self, notebook):
        
        # make sure notebook file exists
        self.assertTrue(notebook.is_file())

        return self.output_path / notebook.stem / notebook.absolute().relative_to(self.notebook_examples)

    def run_notebook(self, notebook, parameters=None, local_files: list[Path]=[]) -> Path:
        """Run a notebook example

        Args:
            notebook (_type_): notebook relative to the "application_examples" folder  
            parameters (dict): additional parameters for the notebook
            local_files (list[Path]): list of python files that are copied into the execution folder

        Returns:
            Path: path to the notebook
        """

        if parameters is None:
            parameters = dict()

        notebook = (self.notebook_examples / notebook).absolute()
        
        # create output path
        output_path = self.get_notebook_output_path(notebook)
        output_path.parent.mkdir(exist_ok=True, parents=True)

        # copy local paths into execution folder
        for local_file in local_files:
            shutil.copyfile(local_file, output_path.parent / local_file.name)

        # setup parameter dictionary
        default_parameters = {}
        default_parameters.update(**parameters)

        print(default_parameters)

        # run the notebook
        pm.execute_notebook(
            notebook,
            output_path,
            cwd=output_path.parent,
            parameters = default_parameters,
            kernel_name='python3'
        )

        # return output path
        return output_path

    def assert_segmentation(self, notebook_path: Path):
        """Assert correction execution of the growth rate notebook

        Args:
            notebook_path (Path): path to the growth rate notebook that has been executed.
        """

        # output path of the notebook
        output_path = notebook_path.parent / "output"

        # check output directory
        self.assertTrue((output_path).is_dir())

        # check existence of all the result files
        self.assertTrue((output_path / "segmented.mp4").is_file())
        self.assertTrue((output_path / "filter_segmented.mp4").is_file())
        self.assertTrue((output_path / "allcells.csv").is_file())
