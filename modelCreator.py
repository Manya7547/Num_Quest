from transformers import MarianMTModel, MarianTokenizer, TFMarianMTModel
import tensorflow as tf

# Load the MarianMT model
model_name = "Helsinki-NLP/opus-mt-en-es"
tokenizer = MarianTokenizer.from_pretrained(model_name)

# Load the TensorFlow version of the model
model = TFMarianMTModel.from_pretrained(model_name)

# Define a concrete function for inference with fixed input shape
@tf.function(input_signature=[tf.TensorSpec(shape=[1, 64], dtype=tf.int32)])  # Fixed input shape [1, 64]
def serving_fn(input_ids):
    # Perform inference with the model
    generated_ids = model.generate(input_ids, max_length=64)  # Limit output length
    # Return the generated token IDs
    return {"generated_ids": generated_ids}

# Export the model to TensorFlow format with a concrete function
tf.saved_model.save(
    model,
    "marianmt_model",
    signatures={"serving_default": serving_fn}
)

# Convert to TensorFlow Lite
converter = tf.lite.TFLiteConverter.from_saved_model("marianmt_model")

# Set the optimization target for compatibility
converter.optimizations = [tf.lite.Optimize.DEFAULT]

tflite_model = converter.convert()

# Save the TFLite model
with open("marianmt_model.tflite", "wb") as f:
    f.write(tflite_model)