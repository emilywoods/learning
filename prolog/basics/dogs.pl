dog_type(good_dog, golden_retriever).
dog_type(good_dog, husky).
dog_type(good_dog, german_shepard).
dog_type(good_dog, irish_wolfhound).

size(medium, golden_retriever).
size(big, husky).
size(big, german_shepard).
size(very_big, irish_wolfhound).

dog_description(A, B)  :- dog_type(A, C), size(B, C).
