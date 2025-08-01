from .base_testing import *
import os

class TestTracking(BaseNotebookTesting):
    def test_tracking(self):
        tracking_notebook = os.environ["TRACKING_NOTEBOOK"]
        output_notebook = self.run_notebook(f"tracking/{tracking_notebook}")

        # make sure that the output notebook is created
        self.assertTrue(output_notebook.is_file())
        self.assertTrue(output_notebook.exists())


        # output path of the notebook
        output_path = output_notebook.parent / "output"

        # make sure that the segmentation notebook output was produced
        self.assertTrue((output_path / "tracked.mp4").exists())

if __name__ == "__main__":
    unittest.main()