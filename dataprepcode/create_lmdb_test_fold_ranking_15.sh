
DATA=cnn2ranking/
DEF_FILES=cnn2ranking/folds/train_val_txt_files_per_ranking/test_fold_ranking_15
OUT=cnn2ranking/folds/train_val_txt_files_per_ranking/test_fold_ranking_15

# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi




echo "Creating  train leveldb..."
convert_imageset --resize_height=$RESIZE_HEIGHT --resize_width=$RESIZE_WIDTH --shuffle  $DATA $DEF_FILES/age_train.txt $OUT/age_train_lmdb

echo "Creating  train subset leveldb..."
convert_imageset --resize_height=$RESIZE_HEIGHT --resize_width=$RESIZE_WIDTH --shuffle  $DATA $DEF_FILES/age_test.txt $OUT/age_test_lmdb

echo "Creating  val leveldb..."
convert_imageset --resize_height=$RESIZE_HEIGHT --resize_width=$RESIZE_WIDTH --shuffle  $DATA $DEF_FILES/age_val.txt $OUT/age_val_lmdb




