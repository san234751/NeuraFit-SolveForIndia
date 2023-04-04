import cv2
import mediapipe as mp
import numpy as np
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_pose = mp.solutions.pose

# For static images:
IMAGE_FILES = ['./images/good_pushup2.jpg']
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

        p1 = results.pose_landmarks.landmark[12]
        p2 = results.pose_landmarks.landmark[24]
        p3 = results.pose_landmarks.landmark[26]
        p4 = results.pose_landmarks.landmark[28]
        # print(p1, p2, p3, p4)
        # check p1, p2 , p3 and p4 are in straight line
        # slope of point p1 and p4
        slope1 = (p1.y - p4.y) / (p1.x - p4.x)
        # slope of point p2 and p3
        slope2 = (p2.y - p3.y) / (p2.x - p3.x)
        # angle between two slope
        angle = np.arctan((slope1 - slope2) / (1 + slope1 * slope2))
        angle = np.degrees(angle)
        print(angle)
        if abs(angle) < 10:
            cv2.putText(image, "Perfect Pushup", (int(0), int(50)),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Perfect Pushup")
        elif abs(angle) < 15:
            cv2.putText(image, "Good Pushup", (int(0), int(50)),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Good Pushup")
        else:
            cv2.putText(image, "Bad Pushup", (int(0), int(50)),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            print("Bad Pushup")

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

# # For webcam input:
# cap = cv2.VideoCapture(0)
# with mp_pose.Pose(
#     min_detection_confidence=0.5,
#     min_tracking_confidence=0.5) as pose:
#   while cap.isOpened():
#     success, image = cap.read()
#     if not success:
#       print("Ignoring empty camera frame.")
#       # If loading a video, use 'break' instead of 'continue'.
#       continue

#     # To improve performance, optionally mark the image as not writeable to
#     # pass by reference.
#     image.flags.writeable = False
#     image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
#     results = pose.process(image)

#     # Draw the pose annotation on the image.
#     image.flags.writeable = True
#     image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
#     mp_drawing.draw_landmarks(
#         image,
#         results.pose_landmarks,
#         mp_pose.POSE_CONNECTIONS,
#         landmark_drawing_spec=mp_drawing_styles.get_default_pose_landmarks_style())
#     # Flip the image horizontally for a selfie-view display.
#     cv2.imshow('MediaPipe Pose', cv2.flip(image, 1))
#     if cv2.waitKey(5) & 0xFF == 27:
#       break
# cap.release()
