
#include <version.h>
#include <stdio.h>


int main() {

  printf("This app is built from git commit: %s, commit date %s\n", GIT_REVISION,
         BUILD_TIMESTAMP);
  printf("And it has version %s\n", THISBUILD);
  printf("With auto build number %s\n", BUILD_VERSION);
  return 0;

}
