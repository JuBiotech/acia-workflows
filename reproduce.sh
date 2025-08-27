##/bin/bash
#
## Reproduction of all example notebooks

segmentation=false
tracking=false
case_studies=false
scaling_01=false
scaling_02=false
scaling_03=false
advanced=false
gpu=false

for arg in "$@"; do
  case $arg in
    --segmentation) segmentation=true ;;
    --tracking) tracking=true ;;
    --case_studies) case_studies=true ;;
    --scaling_01) scaling_01=true ;;
    --scaling_02) scaling_02=true ;;
    --scaling_03) scaling_03=true ;;
    --advanced) advanced=true ;;
    --gpu) gpu=true ;;
    --all) segmentation=true; tracking=true; case_studies=true; scaling_03=true; scaling_02=true; scaling_01=true; advanced=true ;;
    --help) echo "Usage: $0 [--segmentation] [--tracking] [--case_studies] [--scaling] [--all] [--gpu]"; exit 0 ;;
    *) echo "Unknown option: $arg"; exit 1 ;;
  esac
done

echo "Reproduction settings:"
echo "segmentation: $segmentation"
echo "tracking: $tracking"
echo "case_studies: $case_studies"
echo "scaling 01 (GrowthRate): $scaling_01"
echo "scaling 02 (CoCulture): $scaling_02"
echo "scaling 03 (AlternatingOxygen): $scaling_03"
echo "advanced: $advanced"
echo "gpu: $gpu"

gpu_flag=""
if [[ "$gpu" == "true" ]]; then
  gpu_flag="--gpus 0"
fi
echo "GPU flag: $gpu_flag"




#
## Segmentation
if [[ "$segmentation" == "true" ]]; then
    declare -a arr=("Segmentation_Cellpose" "Segmentation_CellposeSAM" "Segmentation_CPN" "Segmentation_Omnipose" "Segmentation_YOLO")

    ## now loop through the tracking array
    for i in "${arr[@]}"
    do
        mkdir -p notebook_runs/segmentation/${i}
        echo Reproduce /home/notebooks/segmentation/${i}.ipynb ...
        COMMAND="docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/segmentation/${i}.ipynb /home/notebook_runs/segmentation/${i}/${i}.ipynb -k python3 --cwd /home/notebook_runs/segmentation/${i}/"
        # -p num_images 800 -p subsampling_factor 2"
        echo "Tracking with: ${COMMAND}"
        ${COMMAND}

    done
fi


## Tracking
if [[ "$tracking" == "true" ]]; then
    declare -a arr=("Tracking_laptrack" "Tracking_pyuat" "Tracking_ultrack" "Tracking_trackastra")

    ## now loop through the tracking array
    for i in "${arr[@]}"
    do
        mkdir -p notebook_runs/tracking/${i}
        echo Reproduce /home/notebook_runs/tracking/${i}.ipynb ...
        COMMAND="docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/tracking/${i}.ipynb /home/notebook_runs/tracking/${i}/${i}.ipynb -k python3 --cwd /home/notebook_runs/tracking/${i}/"
        # -p num_images 800 -p subsampling_factor 2"
        #docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/tracking/${i}.ipynb /home/notebook_runs/tracking/${i}/${i}.ipynb -k python3 --cwd /home/notebook_runs/tracking/${i}/ -p num_images 800 -p subsampling_factor 2
        echo "Tracking with: ${COMMAND}"
        ${COMMAND}
    done
fi


## Case studies
if [[ "$case_studies" == "true" ]]; then

    declare -a arr=("01_GrowthRateQuantification/Quantify_GrowthRates" "02_FluorescenceCoCulture/FluorescenceLabeling" "03_SingleCell_Alternating_Oxygen/Single_cell_alternating_oxygen")

    ## now loop through the tracking array
    for i in "${arr[@]}"
    do
        mkdir -p notebook_runs/case_studies/${i}
        echo Reproduce /home/notebook/case_studies/${i}.ipynb in /home/notebook_runs/case_studies/${i}
        docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/case_studies/${i}.ipynb /home/notebook_runs/case_studies/${i}.ipynb -k python3 --cwd /home/notebook_runs/case_studies/${i}
    done
fi

# Scaling reproduction

# Growth Rate Scaling
if [[ "$scaling_01" == "true" ]]; then
    script_path="01_Scaling_GrowthRate/01_Scaling_GrowthRate"

    mkdir -p notebook_runs/scaling/$script_path
    echo Reproduce /home/scaling/$script_path.ipynb in /home/notebook_runs/scaling/$script_path/execution.ipynb
    docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/scaling/$script_path.ipynb /home/notebook_runs/scaling/$script_path/execution.ipynb -k python3 --cwd /home/notebook_runs/scaling/$script_path -p analysis_script "../../../../notebooks/case_studies/01_GrowthRateQuantification/Quantify_GrowthRates.ipynb"
fi

# Co-Culture Scaling
if [[ "$scaling_02" == "true" ]]; then
    script_path="02_Scaling_CoCulture/Scaling_CoCulture"

    mkdir -p notebook_runs/scaling/$script_path
    echo Reproduce /home/scaling/$script_path.ipynb in /home/notebook_runs/scaling/$script_path/execution.ipynb
    docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/scaling/$script_path.ipynb /home/notebook_runs/scaling/$script_path/execution.ipynb -k python3 --cwd /home/notebook_runs/scaling/$script_path -p analysis_script "../../../../notebooks/case_studies/02_FluorescenceCoCulture/FluorescenceLabeling.ipynb"
fi

# Scaling Alternating oxygen
if [[ "$scaling_03" == "true" ]]; then
    script_path="03_Scaling_Alternating_Oxygen/Scaling_Alternating_Oxygen"

    mkdir -p notebook_runs/scaling/$script_path
    echo Reproduce /home/scaling/$script_path.ipynb in /home/notebook_runs/scaling/$script_path/execution.ipynb
    docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/scaling/$script_path.ipynb /home/notebook_runs/scaling/$script_path/execution.ipynb -k python3 --cwd /home/notebook_runs/scaling/$script_path -p analysis_script "../../../../notebooks/case_studies/03_SingleCell_Alternating_Oxygen/Single_cell_alternating_oxygen.ipynb"
fi

## advanced
if [[ "$advanced" == "true" ]]; then
    declare -a arr=("CTC/Segmentation_and_tracking" )

    ## now loop through the tracking array
    for i in "${arr[@]}"
    do
        mkdir -p notebook_runs/advanced/${i}
        echo Reproduce /home/notebooks/advanced/${i}.ipynb ...
        COMMAND="docker run --rm -v "./:/home/" -u $(id -u):$(id -g) $gpu_flag aw-gpu papermill /home/notebooks/advanced/${i}.ipynb /home/notebook_runs/advanced/${i}/execution.ipynb -k python3 --cwd /home/notebook_runs/advanced/${i}/"
        # -p num_images 800 -p subsampling_factor 2"
        echo "Run command: ${COMMAND}"
        ${COMMAND}

    done
fi
