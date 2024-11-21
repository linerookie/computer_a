
void max(long long int* shvar, long long int array[], long long int size) {
    long long int max_value = array[0];
    for (long long int i = 1; i < size; i++) {
        if (array[i] > max_value) {
            max_value = array[i];
        }
    }
    *shvar = max_value;
}

