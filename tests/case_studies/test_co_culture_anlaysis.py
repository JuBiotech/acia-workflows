from ..base_testing import *

class TestGrowthRateQuantification(BaseNotebookTesting):
    def test_growth_rate(self):
        output_notebook = self.run_notebook("case_studies/02_FluorescenceCoCulture/FluorescenceLabeling.ipynb")

        # make sure that the output notebook is created
        self.assertTrue(output_notebook.is_file())
        self.assertTrue(output_notebook.exists())

        self.assert_segmentation(output_notebook)

        # output path of the notebook
        output_path = output_notebook.parent / "output"

        self.assertTrue((output_path / "coculture_images.png").exists())
        self.assertTrue((output_path / "complete_summary.png").exists())
        self.assertTrue((output_path / "summary_vertical.png").exists())

if __name__ == "__main__":
    unittest.main()