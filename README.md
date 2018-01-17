# filofex
0_0_1: org-mode

IMP-0.01
---...---STA
0, local git dir ~.../filofex (master branch)
1st, add new repo, [x] select add README.md
2nd,
https > urllink > git remote add (origin is NAME, urllink is URL, scope in CURRENT Dir) > git push ...username/passwd([x]2FA) FAIL > remove 2FA ... push (rejected!)
...(1)
To https://github.com/stabatM/filofex.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/stabatM/filofex.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
...(1e)
ssh > keygen(v5.......) > ssh agent daemon(add private key) > xftp pubkey import git key/ssh > git remote remove NAME > git add remote sshlink > git push(reject!)
...(2)
ben@eros:~/filofex$ git push --set-upstream origin master
To github.com:stabatM/filofex.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:stabatM/filofex.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
...(2e)
FINALLY
git push --force  --set-upstream origin master
...(3)
Warning: Permanently added the RSA host key for IP address '192.30.255.112' to the list of known hosts.
Counting objects: 83, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (75/75), done.
Writing objects: 100% (83/83), 136.76 KiB | 0 bytes/s, done.
Total 83 (delta 34), reused 0 (delta 0)
remote: Resolving deltas: 100% (34/34), done.
To github.com:stabatM/filofex.git
 + cc0e509...61e3bc7 master -> master (forced update)
Branch master set up to track remote branch master from origin.
...(3e)
POST
* open 2FA
* reassure
...(4)
ben@eros:~/filofex$ git push
Enter passphrase for key '/home/ben/.ssh/id_rsa': 
Everything up-to-date
...(4e)
---...---END
