#!/usr/bin/bash
FILENAME=$1
OPTION=$2
THRESHOLD="$3"%

#-------------------------------------------
verify_filename(){

    if [ ! -z $FILENAME ] && [ $FILENAME==*".pdf" ];then
        FNAME=${FILENAME%.pdf}
        OUTFILENAME=$FNAME"_compressed.pdf"
    else
        echo "Illegal input. Input filename must be a *.pdf file."
        exit 1
    fi

}
#-------------------------------------------
display_usage(){
    local program_name
    program_name=${0##*/}
    cat <<EOF
Usage: $program_name [PDFfilename][-option]
Options:
    -g             Convert to grayscale
    -m [threshold] Convert to monotone, threshold = 0~100
EOF
}

#-------------------------------------------
exec_monochrome() {

    # some parameters
    local dpi_res=150
    if [ -z $THRESHOLD ]; then
        THRESHOLD=40%
    fi

    echo "Exporting all pages to bmp..."
    gs -sDEVICE=bmpgray -dNOPAUSE -dBATCH -q -r$dpi_res \
       -sOutputFile=./tmp-%04d.bmp $FILENAME

    echo "Applying threshold $THRESHOLD to all bmp..."
    for file in tmp-*.bmp; do
        convert $file -threshold $THRESHOLD ${file%.bmp}.tif
    done

    echo "Gathering all tiffs to output pdf..."
    tiffs=""
    for file in tmp-*.tif; do
        tiffs+="${file} "
    done
    img2pdf -o $OUTFILENAME $tiffs
    
    echo "Cleaning up tmp files..."
    rm ./tmp-*.tif
    rm ./tmp-*.bmp

}

#-------------------------------------------
main() {

    verify_filename

    case $OPTION in
        "")
            display_usage
            exit 0
            ;;
        -g) #convert to grayscale
            OUTFILENAME=$FNAME"_gray.pdf"
            gs -sOutputFile=$OUTFILENAME -sDEVICE=pdfwrite \
              -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
              -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH "$FILENAME"
            echo "Grayscale convertion completed."
            ;;
        -m) #convert to monochrome
            OUTFILENAME=$FNAME"_mono.pdf"
            exec_monochrome
            ;;
        *)
            echo "Option $OPTION not found" >&2
            exit 1
    esac

}

#-------------------------------------------
main "$@"
