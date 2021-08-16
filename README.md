<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** 43app, 43corr, twitter_handle, h.coutaud@outlook.fr, 43corr, 43 gets you started fast, straight to the execution of your code and the edition of main files thanks to its simple and elegant embedded command line.
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/43app/43corr">
    <img src="/pics/logo.jpg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">43corr - Evaluate your 42 projects</h3>

  <p align="center">
    43 gets you started fast, straight to the execution of your code and the editing of your files thanks to its simple and elegant embedded command line.
    <br />
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#screenshots">Screenshots</a></li>
  </ol>
</details>


<!-- USAGE EXAMPLES -->
## Usage

1. Clone the repo from the 42 intra
![Alt text](/pics/gitrepo.png?raw=true "Git repo in intra")
- Example : 
```sh
git clone git@vogsphere-v2.42lyon.fr:vogsphere/intra-uuid-some-numbers correction
```

2. Clone this repo <strong>IN</strong> the folder where all the exercises are
```sh
cd correction
git clone https://github.com/43app/43corr.git 43corr
```

3. Launch the program `43corr.sh` from the folder you imported, with a valid subject (_see `-h` option for more info_)
```sh
cd 43corr
./43corr.sh c03
```

4. Type your commands in the embedded command line (_type `h` for a list of commands_)

![Alt text](/pics/programcli.png?raw=true "The command line of the program")

_Note that you are prompted by default on the first exercise (ex00 for example)_
_To see a detailed version of the features of this program, see <a href="#features">Features</a>_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/43app/43corr/issues) for a list of proposed features (and known issues).



## Features

### Sets of commands :

`c` or `compile` :
    Compiles your .c file with `gcc -Wall -Werror -Wextra`

`ef` or `edit_file` :
    Opens a `vim` window on your `ft_some_funtion.c` file to edit it
    _You may then close the window with `:wq` to go back to the prompt of the program_

`e` or `edit_main` :
    Opens a `vim` window on the `main.c` file to edit it
    _You may then close the window with `:wq` to go back to the prompt of the program_

`h` or `help` :
    Prints the complete set of available commands in the prompt area

`l` or `log_compile` :
    Opens a `vim` window on the `main.c` file to edit it
    _You may then close the window with `:wq` to go back to the prompt of the program_

`n` or `next` :
    Next exercise become the current one
    _You can see the file you are working on before the prompt (`ex01 >>` for example)_

`p` or `prev` :
    Previous exercise become the current one
    _You can see the file you are working on before the prompt (`ex01 >>` for example)_

`q` or `quit` :
    Quit the program

`r` or `run` :
    Runs your program
    _This command still only works for files compiled with the `c` command, and do not take arguments yet (working on it...)_



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the GNU General Public License v3.0 License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/43app/43corr](https://github.com/43app/43corr)



## Screenshots

![Alt text](/pics/programpic.png?raw=true "A picture of the program")
