# Acia-Workflows

**Accio** 🪄 - and your single-cell insights appear - Not quite but - `acia` - and your single-cell insights appear to become much easier within a fully automated workflow 🏗️🚀😉

`acia` presents modular workflow with interchangable segmentation & tracking models offering support for:
- cell segmentation (Cellpose, CellposeSAM, Contour Proposal Network, Omnipose)
- cell tracking (trackastra, ultrack, PyUAT, laptrack)

These individual components are combined to jupyter notebook based workflows that contain the full image analysis pipeline including additional post analysis to investigate living cells. In `acia-workflows`, we present various worklow examples for single-cell analysis:
 - individual analysis steps:
    - **cell segmentation**
    - **cell tracking**
 - full case studies:
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
[colab link](here) | Link | Link | Link


## Tracking

Trackastra | Ultrack | PyUAT | Laptrack
:-: | :-: | :-: | :-:
<video src='https://github.com/user-attachments/assets/0f2d8a49-0be6-44fc-a7ca-a9df2db47922' width=180></video> | <video src='https://github.com/user-attachments/assets/db940ec5-1073-422f-bf49-3077e3163dc6' width=180></video> | <video src='https://github.com/user-attachments/assets/b5f2911d-8a83-45d5-b23b-982727631057' width=180></video> | <video src='https://github.com/user-attachments/assets/64f3ec2b-fd6e-4b28-a1a6-d10882dddff1' width=180></video>
[colab link](here) | Link | Link | Link

## Complete Case Studies 📔

We present three case studies for microbial live-cell imaging:

Growth Rate Quantification | Co-culture Analysis | Single-cell reaction to oxygen alternation
:-: | :-: | :-:
<video src='notebook_runs/segmentation/Segmentation_Cellpose/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CellposeSAM/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CPN/__temp__.mp4' width=180>
[colab link](here) | Link | Link | Link


## Scaling to quantitative insights 🚀

In order to obtain quantitative insights into living cells we implemented feature to scale jupyter notebook workflows across datasets. This yields insights across **10s** to **100s** of time-lapse sequences and bundles them in a comprehensive overview.

Growth Rate Quantification | Co-culture Analysis | Single-cell reaction to oxygen alternation
:-: | :-: | :-:
<video src='notebook_runs/segmentation/Segmentation_Cellpose/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CellposeSAM/__temp__.mp4' width=180> | <video src='notebook_runs/segmentation/Segmentation_CPN/__temp__.mp4' width=180>
[Notebook](notebooks/scaling/01_Scaling_GrowthRate/01_Scaling_GrowthRate.ipynb) | [Notebook](notebooks/scaling/02_Scaling_CoCulture/Scaling_CoCulture.ipynb) | [Notebook](notebooks/scaling/03_Scaling_Alternating_Oxygen/Scaling_Alternating_Oxygen.ipynb)


## More Application Examples

- add Lennarts Example
- add CTC

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

Together we are strong 💪

