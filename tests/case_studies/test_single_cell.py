from ..base_testing import *

class TestGrowthRateQuantification(BaseNotebookTesting):
    def test_growth_rate(self):
        output_notebook = self.run_notebook("case_studies/03_SingleCellInsights/single_cell_reaction.ipynb")

        # make sure that the output notebook is created
        self.assertTrue(output_notebook.is_file())
        self.assertTrue(output_notebook.exists())

        self.assert_segmentation(output_notebook)

        # output path of the notebook
        output_path = output_notebook.parent / "output"

        self.assertTrue((output_path / "sca.png").exists())
        self.assertTrue((output_path / "tsca.png").exists())
        self.assertTrue((output_path / "interesting_single_cell.csv").exists())
        self.assertTrue((output_path / "tracking").exists())

if __name__ == "__main__":
    unittest.main()