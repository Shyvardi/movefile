#!/bin/bash

# הגדרת התיקיה המקורית
source_directory="${MYSOURCE_DIRECTORY}"

# הגדרת התיקיה היעד
destination_directory="${MYDESTINATION_DIRECTORY}"

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
            while fuser "$source_directory/$subdir/$filename" &> /dev/null; do
                echo "הקובץ ב-$source_directory/$subdir נמצא בשימוש, ממתין..."
                sleep 1
            done
            
            # העברת הקובץ מהתיקיה המקורית לתיקיה היעד
            mv "$source_directory/$subdir/$filename" "$full_destination_path/"
            echo "הקובץ $filename הועבר בהצלחה לתיקיה: $subdir/$destination_subdirectory_date"
        fi
    done
done
