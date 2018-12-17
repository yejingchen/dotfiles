========
dotfiles
========

My dotfiles managed by `GNU Stow <https://www.gnu.org/software/stow/stow.html>`_.

Usage
-----

First, install stow if you haven't. Then clone this repo somewhere in your home:

.. code:: sh

    git clone https://github.com/yejingchen/dotfiles.git
    cd dotfiles

Config files for different softwares are placed in different 'stow packages'.
By default none of them are activated, so use ``stoe <pkgname>`` to activate one
(which gets simlinked to ``dotfiles/..``, or ~).
