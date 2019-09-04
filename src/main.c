
#include <gitversion.h>
#include <stdio.h>


int main() {
  printf("This app is built from git commit: %s, commit date %s\n", GIT_REVISION,
         BUILD_TIMESTAMP);
  return 0;

}
