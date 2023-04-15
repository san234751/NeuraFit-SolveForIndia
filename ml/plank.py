import cv2
import mediapipe as mp
import numpy as np
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_pose = mp.solutions.pose

# For static images:
IMAGE_FILES = ['./images/plank1.jpg']
BG_COLOR = (192, 192, 192)  # gray
with mp_pose.Pose(
        static_image_mode=True,
        model_complexity=2,
        enable_segmentation=True,
        min_detection_confidence=0.5) as pose:
    for idx, file in enumerate(IMAGE_FILES):
        image = cv2.imread(file)
        image_height, image_width, _ = image.shape
        # Convert the BGR image to RGB before processing.
        results = pose.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))

        if not results.pose_landmarks:
            continue
        print(
            f'Nose coordinates: ('
            f'{results.pose_landmarks.landmark[mp_pose.PoseLandmark.NOSE].x * image_width}, '
            f'{results.pose_landmarks.landmark[mp_pose.PoseLandmark.NOSE].y * image_height})'
        )

        annotated_image = image.copy()
        # Draw segmentation on the image.
        # To improve segmentation around boundaries, consider applying a joint
        # bilateral filter to "results.segmentation_mask" with "image".
        condition = np.stack((results.segmentation_mask,) * 3, axis=-1) > 0.1
        bg_image = np.zeros(image.shape, dtype=np.uint8)
        bg_image[:] = BG_COLOR
        annotated_image = np.where(condition, annotated_image, bg_image)
        print(results.pose_landmarks)
        # Draw pose landmarks on the image.
        # mp_drawing.draw_landmarks(
        #     annotated_image,
        #     results.pose_landmarks,
        #     mp_pose.POSE_CONNECTIONS,
        #     landmark_drawing_spec=mp_drawing_styles.get_default_pose_landmarks_style())
        # cv2.imwrite('/tmp/annotated_image' +
        #             str(idx) + '.png', annotated_image)

        # plot landmarks on the image using opencv
        for landmark in results.pose_landmarks.landmark:
            # print(landmark)
            cv2.circle(image, (int(landmark.x * image_width),
                       int(landmark.y * image_height)), 5, (0, 0, 255), -1)

        # points for back
        p1 = results.pose_landmarks.landmark[12]
        p2 = results.pose_landmarks.landmark[24]
        p3 = results.pose_landmarks.landmark[26]
        p4 = results.pose_landmarks.landmark[28]
        # points for right hand
        p5 = results.pose_landmarks.landmark[12]
        p6 = results.pose_landmarks.landmark[14]
        p7 = results.pose_landmarks.landmark[16]
        # points for right hand
        p8 = results.pose_landmarks.landmark[11]
        p9 = results.pose_landmarks.landmark[13]
        p10 = results.pose_landmarks.landmark[15]
        # print(p1, p2, p3, p4)
        # check p1, p2 , p3 and p4 are in straight line
        # slope of point p1 and p4
        slope1 = (p1.y - p4.y) / (p1.x - p4.x)
        # slope of point p2 and p3
        slope2 = (p2.y - p3.y) / (p2.x - p3.x)
        # slope of point p5 and p6, p6 and p7, p8 and p9, p9 and p10
        slope3 = (p5.y - p6.y) / (p5.x - p6.x)
        slope4 = (p6.y - p7.y) / (p6.x - p7.x)
        slope5 = (p8.y - p9.y) / (p8.x - p9.x)
        slope6 = (p9.y - p10.y) / (p9.x - p3.x)
        # angle between slopes
        angle = np.arctan((slope1 - slope2) / (1 + slope1 * slope2))
        angle = np.degrees(angle)
        print(angle)

        anglehand1 = np.arctan((slope3 - slope4) / (1 + slope3 * slope4))
        anglehand1 = np.degrees(anglehand1)
        print(anglehand1)

        anglehand2 = np.arctan((slope5 - slope6) / (1 + slope5 * slope6))
        anglehand2 = np.degrees(anglehand2)
        print(anglehand2)

        if abs(angle) < 10 and abs(anglehand1) < 110 and abs(anglehand1) > 80 and abs(anglehand2) < 110 and abs(anglehand2) > 80:
            cv2.putText(image, "Perfect Plank", (int(0), int(50)),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Perfect Plank")
        else:
            cv2.putText(image, "Bad Plank", (int(0), int(50)),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Bad Plank")

        # Draw line between p1, p2, p3 and p4
        cv2.line(image, (int(p1.x * image_width), int(p1.y * image_height)),
                 (int(p4.x * image_width), int(p4.y * image_height)), (0, 255, 0), 2)
        cv2.line(image, (int(p2.x * image_width), int(p2.y * image_height)),
                 (int(p3.x * image_width), int(p3.y * image_height)), (0, 255, 0), 2)

        # mp_drawing.draw_landmarks(
        #     image,
        #     results.pose_landmarks,
        #     mp_pose.POSE_CONNECTIONS,
        #     landmark_drawing_spec=mp_drawing_styles.get_default_pose_landmarks_style())
        cv2.imshow('MediaPipe Pose', image)
        cv2.waitKey(0)
        # Plot pose world landmarks.
        # mp_drawing.plot_landmarks(
        #     results.pose_world_landmarks, mp_pose.POSE_CONNECTIONS)
