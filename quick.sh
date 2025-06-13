mkdir ex00
cd ex00
git init
# ex00
echo tblochet > README.md
git add README.md 
git commit -m 'chore(README): login in file'
echo $(git rev-parse HEAD) > git.txt
git add git.txt 
git commit -m 'chore(git.txt): added signature from last commit'
cd ..
# ex01
mkdir ex01
cd ex01
git init
echo tblochet > README.md
git add README.md 
git commit -m 'chore(README): login in file'
echo $(git rev-parse HEAD) > git.txt
git add git.txt 
git commit -m 'chore(git.txt): added signature from last commit'
git checkout -b doc/truth
echo '42 is the best school in the world.' > truth.txt
git add truth.txt
git commit -m 'chore(truth): added the universal truth'
git checkout main
git merge --commit --no-ff --no-edit doc/truth
git checkout -b fix/truth-doc
echo '42Paris is the best school in the world.' > truth.txt
git add truth.txt
git commit -m 'chore(truth): unvoluntary typo'
git checkout main
git merge fix/truth-doc
git branch --delete doc/truth fix/truth-doc
cd ..
# ex02
mkdir ex02
cd ex02
git init
echo tblochet > README.md
git add README.md 
git commit -m 'chore(README): login in file'
echo $(git rev-parse HEAD) > git.txt
git add git.txt 
git commit -m 'chore(git.txt): added signature from last commit'
cat <<EOF >main.c
#include <stdio.h>

int main(void)
{
        char *best_of_the_best = "ottomata";
        printf("%s is the best.\n", best_of_the_best);
        return (0);
}
EOF
git add main.c
git commit -m 'feat(main): entry point'
git checkout -b feat/main
cat <<EOF >main.c
#include <stdio.h>

int main(void)
{
        char *one_of_the_best = "<login>";
        printf("%s is the best.\n", one_of_the_best);
        return (0);
}
EOF
git add main.c
git commit -m 'feat(main): new entry point'
git checkout main
cat <<EOF >main.c
#include <stdio.h>

int main(void)
{
        char *best_of_the_best = "ottomata";
        printf("%s is one of the best.\n", best_of_the_best);
        return (0);
}
EOF
git add main.c
git commit -m 'fix(main): typo'
git merge --no-edit feat/main
cp main.c ../conflicts.txt
cat << EOF > main.c
#include <stdio.h>

int main(void)
{
        char *one_of_the_best = "tblochet";
        printf("%s is one of the best.\n", one_of_the_best);
        return (0);
}
EOF
git add main.c
git merge --continue
mv ../conflicts.txt ./
cd ..
# ex03
mkdir ex03
cd ex03
git init
echo tblochet > README.md
git add README.md 
git commit -m 'chore(README): login in file'
echo $(git rev-parse HEAD) > git.txt
git add git.txt 
git commit -m 'chore(git.txt): added signature from last commit'
cp /home/tblochet/projects/pedago/to-git-or-not-to-git/ex03/* .
git add .
git commit -m 'feat(main): source data files'
git checkout -b feat/new-cats
echo "moulinette,6,grey,8" >> cats.csv
git add cats.csv
git commit -m 'feat(cats): Added moulinette'
echo "norminet,13,grey,15" >> cats.csv
git add cats.csv
git commit -m 'feat(cats): Added norminet'
echo "isambert,12,black,22" >> cats.csv
git add cats.csv
git commit -m 'feat(cats): Added isambert'
git checkout main
echo "Herbert,1,grey,140" >> dogs.csv
git add dogs.csv
git commit -m 'feat(dogs): added herbert'
git checkout feat/new-cats
git rebase -i main
git checkout main
git merge --no-ff feat/new-cats
