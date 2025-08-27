from .base_testing import *
import os

class TestSegmentation(BaseNotebookTesting):
    def test_growth_rate(self):
        segmentation_notebook = os.environ["SEGMENTATION_NOTEBOOK"]
        output_notebook = self.run_notebook(f"segmentation/{segmentation_notebook}")

        # make sure that the output notebook is created
        self.assertTrue(output_notebook.is_file())
        self.assertTrue(output_notebook.exists())

        self.assert_segmentation(output_notebook)

        # output path of the notebook
        output_path = output_notebook.parent / "output"

        # make sure that the segmentation notebook output was produced
        self.assertTrue((output_path / "segmented.mp4").exists())
        self.assertTrue((output_path / "allcells.csv").exists())
        self.assertTrue((output_path / "filter_segmented.mp4").exists())

if __name__ == "__main__":
    unittest.main()