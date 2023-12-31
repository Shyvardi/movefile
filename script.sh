#!/bin/bash

# הגדרת התיקיה המקורית
source_directory="/home/shy/Hdd/FTP/data"

# הגדרת התיקיה היעד
destination_directory="/home/shy/Hdd/MotionEye/Media"

# שמות התיקיות משנה בתיקית המקור
subdirectories=("Camera1" "Camera2" "Camera3" "Camera4")

# הפעלת הסקריפט ברקע והמתנה לשינויים בתיקית המקור
inotifywait -m -e create --format "%f" -r "$source_directory" | while read -r filename; do
    for subdir in "${subdirectories[@]}"; do
        # בדיקה אם הקובץ נמצא בתיקית המשנה
        if [ -e "$source_directory/$subdir/$filename" ]; then
            # יצירת שם תיקיה יעד עם התאריך הנוכחי
            destination_subdirectory_date="$(date +'%Y-%m-%d')"
            full_destination_path="$destination_directory/$subdir/$destination_subdirectory_date"

            # בדיקה אם התיקיה היעד כבר קיימת, ואם לא - יצירתה
            if [ ! -d "$full_destination_path" ]; then
                mkdir -p "$full_destination_path"
                echo "נוצרה תיקיה חדשה: $subdir/$destination_subdirectory_date"
            fi

            # בדיקת פעילות בקובץ על ידי fuser
            #!/bin/bash

# הגדרת התיקיה המקורית
source_directory="/home/shy/Hdd/FTP/data"

# הגדרת התיקיה היעד
destination_directory="/home/shy/Hdd/MotionEye/Media"

# שמות התיקיות משנה בתיקית המקור
subdirectories=("Camera1" "Camera2" "Camera3" "Camera4")


# הפעלת הסקריפט ברקע והמתנה לשינויים בתיקית המקור
inotifywait -m -e create --format "%f" -r "$source_directory" | while read -r filename; do
    for subdir in "${subdirectories[@]}"; do
        # בדיקה אם הקובץ נמצא בתיקית המשנה
        if [ -e "$source_directory/$subdir/$filename" ]; then
            # יצירת שם תיקיה יעד עם התאריך הנוכחי
            destination_subdirectory_date="$(date +'%Y-%m-%d')"
            full_destination_path="$destination_directory/$subdir/$destination_subdirectory_date"

            # בדיקה אם התיקיה היעד כבר קיימת, ואם לא - יצירתה
            if [ ! -d "$full_destination_path" ]; then
                mkdir -p "$full_destination_path"
                echo "נוצרה תיקיה חדשה: $subdir/$destination_subdirectory_date"
            fi
           
            echo "$(fuser "$source_directory/$subdir/$filename")"
           
            while true; do
                current_fuser_value="$(fuser "$source_directory/$subdir/$filename")"
               
    
                if [ ${#current_fuser_value} -eq 0 ]; then
                  break
                fi

                echo "הקובץ עדיין מקליט."
                sleep 1
            done
            


            # העברת הקובץ מהתיקיה המקורית לתיקיה היעד
            mv "$source_directory/$subdir/$filename" "$full_destination_path/"
            echo "הקובץ $filename הועבר בהצלחה לתיקיה: $subdir/$destination_subdirectory_date"
        fi
    done
done
            
            # העברת הקובץ מהתיקיה המקורית לתיקיה היעד
            mv "$source_directory/$subdir/$filename" "$full_destination_path/"
            echo "הקובץ $filename הועבר בהצלחה לתיקיה: $subdir/$destination_subdirectory_date"
        fi
    done
done
