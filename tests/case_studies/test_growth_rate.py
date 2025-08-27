from ..base_testing import *

class TestGrowthRateQuantification(BaseNotebookTesting):
    def test_growth_rate(self):
        output_notebook = self.run_notebook("case_studies/01_GrowthRateQuantification/01_Quantify_GrowthRates.ipynb")
        
        # make sure that the output notebook is created
        self.assertTrue(output_notebook.is_file())
        self.assertTrue(output_notebook.exists())

        self.assert_segmentation(output_notebook)

        # output path of the notebook
        output_path = output_notebook.parent / "output"

        self.assertTrue((output_path / "gr_comparison.png").exists())
        self.assertTrue((output_path / "growth_estimates.csv").exists())
        self.assertTrue((output_path / "summary_vertical.png").exists())

if __name__ == "__main__":
    unittest.main()