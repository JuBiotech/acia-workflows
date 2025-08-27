<div align="center">

<p align="center">
<img src="artwork/acia_logo_small.png" alt="Optimus Prime" style="width:15%;"/>
</p>

</div>

# Acia-Workflows: Automated Single-cell Imaging Analysis for Scalable and Deep learning-based Live-cell Imaging Analysis Workflows

**Accio** 🪄 - and your single-cell insights appear - Not quite but - the `acia-workflows` platform - and your single-cell insights appear to become much easier within a fully automated workflow 🏗️🚀😉

The `acia-workflows` platform combines three components:
1. the [`acia`](https://github.com/JuBiotech/acia-core) framework provides modular image analyis pipelines with state-of-the-art segmentation (Cellpose, CellposeSAM, Contour Proposal Network, Omnipose) and tracking (trackastra, ultrack, PyUAT, laptrack) methods
2. the implementation of workflows in form of a Jupyter Notebook incorporating Python code, extensive documentation, software dependencies and visualization into a single document
3. a collection of workflow examples that are reproducible in the webbrowser.

The collection of application workflows contains the full image analysis pipeline including additional post analysis to investigate living cells. In `acia-workflows`, we present various worklow applications for single-cell analysis:
 - individual analysis steps:
    - **cell segmentation**
    - **cell tracking**
 - full application workflows:
    - **growth rate quantification**
    - **co-culture characterization**
    - **alternating oxygen effects on the single-cell level**
    
Moreover, we showcase a simple but efficient way to **scale** the development workflows to **10s or 100s** of time-lapse sequences to generate **quantitative** and **robust** insights.

The workflows are implemented in juypter notebooks and contain the software dependencies, data, visualization and extensive text descriptions. Therefore, they are [fully reproducible](#reproducibility) and you can execute them in your [local jupyterlab](#local-installation-docker) or directly on [colab](https://colab.research.google.com/) without any installation.

Feel the magic of automation 🪄 and have fun with your live-cell imaging analysis 🦠🔬🚀

## Segmentation 🦠

We provide support for multiple segmentation approaches:

Cellpose | CellposeSAM | Contour Proposal Network | Omnipose
:-: | :-: | :-: | :-:
<video src='https://github.com/user-attachments/assets/5006bde0-6662-43b4-bd41-b433c9cb96b1' width=180></video> | <video src='https://github.com/user-attachments/assets/fc255d2a-2f61-40ee-82be-6510f12c2a71' width=180></video> | <video src='https://github.com/user-attachments/assets/f34416fd-6326-4b5c-8f5c-79ff16eca7ff' width=180></video> | <video src='https://github.com/user-attachments/assets/3a144042-64ad-4fec-a701-93137041b25f' width=180></video>
[Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/segmentation/Segmentation_Cellpose.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/segmentation/Segmentation_CellposeSAM.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/segmentation/Segmentation_CPN.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/segmentation/Segmentation_Omnipose.ipynb)


## Tracking

Trackastra | Ultrack | PyUAT | Laptrack
:-: | :-: | :-: | :-:
<video src='https://github.com/user-attachments/assets/0f2d8a49-0be6-44fc-a7ca-a9df2db47922' width=180></video> | <video src='https://github.com/user-attachments/assets/db940ec5-1073-422f-bf49-3077e3163dc6' width=180></video> | <video src='https://github.com/user-attachments/assets/b5f2911d-8a83-45d5-b23b-982727631057' width=180></video> | <video src='https://github.com/user-attachments/assets/64f3ec2b-fd6e-4b28-a1a6-d10882dddff1' width=180></video>
[Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/tracking/Tracking_trackastra.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/tracking/Tracking_ultrack.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/tracking/Tracking_pyuat.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/tracking/Tracking_laptrack.ipynb)

## Complete workflow examples 📔

We present three application workflows that perform the entire analysis of microbial live-cell imaging experiments:

Growth Rate Quantification | Co-culture Analysis | Single-cell reaction to oxygen alternation
:-: | :-: | :-:
<video src='notebook_runs/segmentation/Segmentation_Cellpose/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CellposeSAM/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CPN/__temp__.mp4' width=180>
[Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/case_studies/01_GrowthRateQuantification/Quantify_GrowthRates.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/case_studies/02_FluorescenceCoCulture/FluorescenceLabeling.ipynb) | [Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/case_studies/03_SingleCell_Alternating_Oxygen/Single_cell_alternating_oxygen.ipynb)


## Scaling to quantitative insights 🚀

In order to obtain quantitative insights into living cells we implemented feature to scale jupyter notebook workflows across datasets. This yields insights across **10s** to **100s** of time-lapse sequences and bundles them in a comprehensive overview. We demonstrate the for our example workflows:

Growth Rate Quantification | Co-culture Analysis | Single-cell reaction to oxygen alternation
:-: | :-: | :-:
<video src='notebook_runs/segmentation/Segmentation_Cellpose/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CellposeSAM/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CPN/__temp__.mp4' width=180>
[Notebook](notebooks/scaling/01_Scaling_GrowthRate/01_Scaling_GrowthRate.ipynb) | [Notebook](notebooks/scaling/02_Scaling_CoCulture/Scaling_CoCulture.ipynb) | [Notebook](notebooks/scaling/03_Scaling_Alternating_Oxygen/Scaling_Alternating_Oxygen.ipynb)


## More Application Workflows

CTC datasets (Hela) | ...
:-: | :-:
<video src='https://github.com/user-attachments/assets/50772968-c342-4b7f-a483-448c0e800f9c' width=180></video> | ...
[Open notebook](https://colab.research.google.com/github/JuBiotech/acia-workflows/blob/main/notebooks/advanced/CTC/Segmentation_and_tracking.ipynb) | ...

## Getting started

Instructions to install the software and get the examples running.

### Immediately online using google colab

Please have a look at the colab links for [segmentation](#segmentation), [tracking](#tracking), and complete [case studies](#complete-case-studies).

### Local installation (docker)

To use the analsis workflows on your local computer, we provide a docker container with all dependencies

You can install it via the command line:
```bash
bash build.sh
docker run -v "./notebooks:/home/notebooks" -u $(id -u):$(id -g) -p 8888:8888 aw-gpu
```

**Note:** Local installation is designed for Linux. May differ for other operating systems.

### Local installation (conda)

To reproduce and use these analsis workflows on your local computer, you need to install jupyterhub and some dependencies. At best use a linux-based operating system. Please create a new environment and install the dependencies:

```bash
git clone https://github.com/JuBiotech/acia-workflows.git
cd acia-workflows

conda create -n acia-workflows python=3.10 jupyterlab -c conda-forge
conda activate acia-workflows
jupyter lab
```

A browser windows should open that shows the **jupyter lab** view

## Reproducibility

In order to reproduce the results presented in the paper and the workflows, we provide a Docker environment and a reproduction script. In order to reproduce please execute the following:

```bash
bash build.sh
bash reproduce.sh --all --gpu
```

The executed notebooks will be placed in the `notebook_runs` folder.

**Note:** If you do not have a GPU avaialable please use the flag `--cpu` instead. Be aware that this drastically increases the runtime of the reproduction. The full reproduction will take several hours!
**Note:** Please use a linux system for full reproduction.

## Contribute

Our work is designed to create sharable and reproducible workflows that also scale to high-throughput data. While we present three common analyses, this is of course does not cover the immense variety and complexity that we seen in live-cell imaging analyses. Therefore, we need **you** and your opinions 🤩 There are two major ways you can contribute:

1. You have data and an analysis in mind but you cannot extract the insights with your analyses scripts. Open a discussion on your analysis case [here](-/issues) and get the opinion of our community.

2. You have developed your own analysis workflow and you are so proud of it that you would like to share it with others. Then also open a discussion [here](-/issues) and let's make others benefit from your work by incorporation your script into our collection.

Together we are strong and advancing 💪

