초보자 튜토리얼

# Why Spacemacs?

-   Unparallelled text and structure editing for all types of writing tasks: creative writing, blogging, note-taking, todo-lists,
    scientific papers…
-   Powerful modes for programming in dozens of programming languages
-   Deeply customizable yet beginner-friendly

* 모든 유형의 글쓰기 작업을 위한 탁월한 텍스트 및 구조 편집, 예를 들어 창의 글쓰기, 블로깅, 메모 작성, 할일 관리, 과학 논문 등 
* 수십 가지 프로그래밍 언어로 프로그래밍을 지원하는 강력한 모드
* 사용자 커스텀이 가능하면서도 초보자에게 접근성이 높다

# Installation and setup

Spacemacs는 Emacs라는 인기 있는 텍스트 편집기의 초보자 친화적이고 강력한 확장입니다. Spacemacs를 설치하려면 먼저 기본 Emacs를 설치한 다음 Spacemacs 확장 파일을 다운로드해야 합니다. 이는 Git이라는 프로그램을 사용하여 가장 쉽게 수행할 수 있습니다. 각 단계는 [Readme](https://github.com/syl20bnr/spacemacs/blob/master/README.md#prerequisites) 문서에 쉽고 자세하게 설명되어 있습니다.

# Getting started

## Key binding notation

Spacemacs의 힘은 효율적인 키 바인딩에 있습니다. Emacs를 기반으로 하기 때문에 키 바인딩 표기법에 Emacs 규칙을 사용합니다. 가장 중요한 수정 키는 다음과 같습니다.

-   `SPC` = `Space`, Vim 편집 스타일에서 `리더키`로 사용
-   `RET` = `Return` (`Enter`) 엔터키
-   `C-` = `Ctrl` 
-   `M-` (for "meta") = `Alt`
-   `S-` = `Shift`

The modifier keys can be used either in a sequence or as key chords by
pressing two keys at the same time. `SPC 1` is notation for a key
sequence and means pressing `Space` first and pressing `1` after it. Key
chords are notated by writing a `-` between the keys. Thus `C-c` means
pressing `Ctrl` and the letter `c` simultaneously. Key chords and
sequences can also be combined: `C-c a` means "First press `Ctrl` and
`c` simultaneously, then press `a`". `C-c C-a` means "First press `Ctrl`
and `c` simultaneously, then press `Ctrl` and `a` simultaneously".

This document assumes you chose the "Vim" editing style and notates
accordingly. If you chose the Emacs editing style, just substitute `SPC`
with `M-m` in all the commands that begin with `SPC`.

(Note: Other modifier keys such as `Super`, notated with a small-case `s-`, can be set up but this is rarely necessary in Spacemacs).

수정자 키는 순서대로 또는 두 개의 키를 동시에 눌러 키 코드로 사용할 수 있습니다. `SPC 1`는 키 시퀀스에 대한 표기법으로 `Space`먼저 누르고 그 다음에 누르는 것을 의미 `1`합니다. `-`키 코드는 키 사이 에 작성하여 표기 합니다. 따라서 와 문자 를 동시에 `C-c`누르는 것을 의미 합니다. 키 코드와 시퀀스도 결합할 수 있습니다. "먼저 누르고 동시에 누른 다음 누르 십시오"를 의미합니다. "먼저 와 동시에 누른 다음 와 동시에 누르십시오"를 의미 합니다.`Ctrl``c``C-c a``Ctrl``c``a``C-c C-a``Ctrl``c``Ctrl``a`

이 문서는 "Vim" 편집 스타일을 선택했다고 가정하고 그에 따라 설명합니다. Emacs 편집 스타일을 선택한 경우 로 시작하는 모든 명령에서 로 `SPC`대체 하십시오 .`M-m``SPC`

`Super`(참고: 소문자로 표기된 와 같은 다른 수정 키를 `s-`설정할 수 있지만 Spacemacs에서는 거의 필요하지 않습니다.)

## Modal text editing - why and how?

Writing (or programming) is typically not a simple linear process of
adding words and lines until finished. At least as important part of the
work consists of editing the text: deleting and rewriting parts, moving
sentences around or jumping to an earlier point to fix a discrepancy.

The crudest way to, for example, delete a certain line is moving the
mouse to the line in question, clicking on the line and then deleting it
by pressing backspace repeatedly. This is slow and inefficient, both
because you have to take your hands from your keyboard and because
repeatedly pressing backspace takes time. The more time you spend
pressing keys, the more time and energy is wasted.

To speed up editing, many editors use key chords for common editing
tasks: `Control-c` for copying and so on. However, these types of
shortcuts tend to have two problems. First, you have to press two keys
at the same time, which is harder to coordinate and thus slower than
pressing keys in a sequence. Second, you typically have to use your
weakest fingers (pinkies) extensively and bend your wrists in
unergonomic positions, which is uncomfortable for many and risks
developing carpal tunnel syndrome in the long run.

By contrast, Spacemacs uses modal editing. Modal editing means that
different modes are used for editing and writing text. While this can
sound complicated at first, in practice it can be learned quickly and
once learned is unparallelled in speed and ergonomy. Our earlier example
of deleting a certain line of text (a very common edit task) can be
achieved in Spacemacs by simply navigating to the line in question with
the keys `j` and `k` (navigation keys) and pressing `d` (for "delete")
two times!

You might have noticed that this was achieved entirely without moving
your fingers from your home row (the row where your fingers lie in rest
when touch-typing) and without using modifier keys.

쓰기(또는 프로그래밍)는 일반적으로 완료될 때까지 단어와 행을 추가하는 단순한 선형 프로세스가 아닙니다. 작업의 적어도 중요한 부분은 텍스트 편집으로 구성됩니다. 부분을 삭제하고 다시 작성하고, 문장을 이동하거나 불일치를 수정하기 위해 이전 지점으로 이동합니다.

예를 들어 특정 줄을 삭제하는 가장 조잡한 방법은 해당 줄로 마우스를 이동하고 해당 줄을 클릭한 다음 백스페이스를 반복해서 눌러 삭제하는 것입니다. 이는 키보드에서 손을 떼야 하고 백스페이스를 반복적으로 누르는 데 시간이 걸리기 때문에 느리고 비효율적입니다. 키를 누르는 데 더 많은 시간을 할애할수록 더 많은 시간과 에너지가 낭비됩니다.

편집 속도를 높이기 위해 많은 편집자는 일반적인 편집 작업 `Control-c`(복사 등)에 키 코드를 사용합니다. 그러나 이러한 유형의 바로 가기에는 두 가지 문제가 있는 경향이 있습니다. 첫째, 두 개의 키를 동시에 눌러야 하는데, 이는 조정하기가 더 어렵기 때문에 키를 연속해서 누르는 것보다 느립니다. 둘째, 일반적으로 가장 약한 손가락(핑키)을 광범위하게 사용하고 인체공학적이지 않은 위치에서 손목을 구부려야 합니다. 이는 많은 사람들에게 불편하고 장기적으로 수근관 증후군을 유발할 위험이 있습니다.

대조적으로 Spacemacs는 모달 편집을 사용합니다. 모달 편집은 텍스트 편집 및 쓰기에 서로 다른 모드가 사용됨을 의미합니다. 처음에는 복잡하게 들릴 수 있지만 실제로는 빠르게 배울 수 있으며 일단 배우면 속도와 인체 공학 면에서 비교할 수 없습니다. 특정 텍스트 줄을 삭제하는 이전 예제(매우 일반적인 편집 작업)는 Spacemacs에서 키 `j`와 `k`(탐색 키)를 사용하여 문제의 줄로 이동하고 ( `d` "삭제"의 경우) 두 번 누르기만 하면 수행할 수 있습니다!

홈 행(터치 타이핑 시 손가락이 놓여 있는 행)에서 손가락을 움직이지 않고 수정자 키를 사용하지 않고 이 작업이 완전히 수행되었음을 알 수 있습니다.

## Start the Vim tutorial

The modal editing features of Spacemacs originate from a text editor
called [Vi](https://en.wikipedia.org/wiki/Vi), and thus the modal
editing tutorial is called eVIl tutor. Press `SPC h T v` (that is, the
`spacebar` followed by `h`, `T` and `v`) to familiarize yourself with
modal editing.

[Spacemacs의 모달 편집 기능은 Vi](https://en.wikipedia.org/wiki/Vi) 라는 텍스트 편집기에서 시작 하므로 모달 편집 튜토리얼을 eVIl 튜터라고 합니다. 모달 편집에 익숙해지려면 `SPC h T v` (즉 , , 및 ) `spacebar`를 누르 십시오.`h``T``v`

## Using the spacebar to launch commands

Now that you are familiar with writing and editing text it is time to
put the "Space" into Spacemacs. Because the spacebar is the most
accessible key on the keyboard and is pressed by the strongest fingers
(the thumbs), it is a natural choice for launching commands. You can
think of it as the start menu of Spacemacs.

A short instant after the spacebar is pressed a menu pops up. This
interactive menu shows you what submenus and commands can be accessed by
subsequent keypresses. Browsing around this menu is a great way of
finding new features in Spacemacs, so keep an eye on the different
options! `ESC` usually breaks the combination you don't want to use.

이제 텍스트 작성 및 편집에 익숙해졌으므로 Spacemacs에 "Space"를 넣을 차례입니다. 스페이스바는 키보드에서 가장 접근하기 쉬운 키이고 가장 강한 손가락(엄지손가락)으로 누르기 때문에 명령을 실행하기 위한 자연스러운 선택입니다. Spacemacs의 시작 메뉴라고 생각하시면 됩니다.

스페이스바를 누른 후 잠시 후 메뉴가 나타납니다. 이 대화형 메뉴는 후속 키 누름으로 액세스할 수 있는 하위 메뉴와 명령을 보여줍니다. 이 메뉴를 탐색하는 것은 Spacemacs의 새로운 기능을 찾는 좋은 방법이므로 다양한 옵션을 주시하십시오! `ESC`일반적으로 사용하고 싶지 않은 조합을 중단합니다.


## Buffers, windows and frames

Because Emacs (the extension of which Spacemacs is) was developed in the
'80s before the advent of modern graphical user interfaces, Emacs has a
different name of what we normally call "windows": in Emacs these are
called "frames". A frame is what pops up when you launch Spacemacs from
your desktop shortcut. A frame contains windows and buffers.

Windows are the visual spaces a frame is divided into. The default is
one, but windows can be split to allow editing multiple files in one
frame. Let's try this. Press `SPC` to bring up the menu. You can see
different letters having different submenus associated with them,
usually with a mnemonic for easier recall. The letter w is assigned for
"windows": press it. A new menu opens with further options. Write the
character / to split the currently active window vertically into two.

Now you should see two windows of this tutorial, and the one on the left
should be active, as can be seen from the modeline in the bottom or by
moving the cursor around using the navigation keys. This isn't very
useful, as we would probably want to see a different file on the right.

First, activate the window on the right with `SPC 2`. Now that the
window on the right is active, we can open a different buffer for a
different file. We'll use the scratch buffer, which can be used like a
notepad. Be warned, unlike other buffers it doesn't prompt you whether
you want to save the changes you've made when quitting the program!
Press `SPC b` to open the buffers menu and then switch to the scratch
buffer by pressing s. Now you have two different buffers in two
different windows open, great! You can write something on the scratch
buffer, and when you're done, make sure that the scratch window is
active and close it by pressing `SPC w d`.

Now the tutorial window fills the whole frame. But you only closed the
window, not the scratch buffer, so the buffer is still open beneath the
surface. You can quickly switch between the current buffer and the last
with `SPC TAB`: use this a couple of times to switch between the
tutorial and the scratch buffer. `SPC b` has more options for switching
between buffers, for example `SPC b b` opens a searchable list of all
currently open buffers and `SPC b d` closes the current buffer.

Emacs(Spacemacs의 확장)는 현대적인 그래픽 사용자 인터페이스가 등장하기 전인 80년대에 개발되었기 때문에 Emacs는 일반적으로 "창"이라고 부르는 것과 다른 이름을 가지고 있습니다. Emacs에서는 이를 "프레임"이라고 합니다. 프레임은 바탕 화면 바로 가기에서 Spacemacs를 실행할 때 팝업되는 것입니다. 프레임에는 창과 버퍼가 포함됩니다.

창은 프레임이 분할되는 시각적 공간입니다. 기본값은 하나이지만 한 프레임에서 여러 파일을 편집할 수 있도록 창을 분할할 수 있습니다. 이것을 시도해 봅시다. 눌러 `SPC`메뉴를 불러옵니다. 서로 다른 하위 메뉴가 있는 다른 문자를 볼 수 있으며 일반적으로 쉽게 기억할 수 있도록 니모닉이 있습니다. 문자 w는 "창"에 할당됩니다. 누르십시오. 추가 옵션이 있는 새 메뉴가 열립니다. 현재 활성 창을 세로로 두 개로 분할하려면 / 문자를 작성합니다.

이제 이 튜토리얼의 두 개의 창이 표시되어야 하며 왼쪽에 있는 창이 활성화되어 있어야 합니다. 하단의 모델라인에서 볼 수 있거나 탐색 키를 사용하여 커서를 이리저리 움직여 볼 수 있습니다. 오른쪽에 다른 파일이 표시되기를 원할 것이므로 이것은 별로 유용하지 않습니다.

먼저 을 사용하여 오른쪽에 있는 창을 활성화합니다 `SPC 2`. 이제 오른쪽 창이 활성화되었으므로 다른 파일에 대해 다른 버퍼를 열 수 있습니다. 메모장처럼 사용할 수 있는 스크래치 버퍼를 사용하겠습니다. 다른 버퍼와 달리 프로그램을 종료할 때 변경한 내용을 저장할 것인지 묻는 메시지가 표시되지 않습니다. 를 눌러 `SPC b`버퍼 메뉴를 연 다음 s를 눌러 스크래치 버퍼로 전환합니다. 이제 두 개의 다른 창에 두 개의 다른 버퍼가 열려 있습니다. 좋습니다! 스크래치 버퍼에 무언가를 쓸 수 있으며 완료되면 스크래치 창이 활성화되어 있는지 확인하고 를 눌러 닫습니다 `SPC w d`.

이제 튜토리얼 창이 전체 프레임을 채웁니다. 그러나 스크래치 버퍼가 아니라 창을 닫았을 뿐이므로 버퍼는 여전히 표면 아래에 열려 있습니다. 현재 버퍼와 마지막 버퍼 사이를 빠르게 전환할 수 있습니다 `SPC TAB`. : 이것을 몇 번 사용하여 튜토리얼과 스크래치 버퍼 사이를 전환합니다. `SPC b` 예를 들어 `SPC b b`현재 열려 있는 모든 버퍼의 검색 가능한 목록을 열고 현재 버퍼를 `SPC b d`닫습니다.

## Accessing files

Files can be accessed under the `SPC f` mnemonic. You can navigate to
any file with `SPC f f` and open it by pressing `RET`. Accessing
recently opened files is a very common task and is done with `SPC f r`.
An edited file is saved with `SPC f s`.

파일은 SPC f니모닉으로 액세스할 수 있습니다. 를 사용하여 모든 파일을 탐색하고 SPC f f를 눌러 열 수 있습니다 RET. 최근에 연 파일에 액세스하는 것은 매우 일반적인 작업이며 로 수행됩니다 SPC f r. 편집된 파일은 로 저장됩니다 SPC f s.



# Configuring Spacemacs

## Adding language support and other features: using layers

Spacemacs divides its configuration into self-contained units called
configuration layers. These layers are stacked on top of each other to
achieve a custom configuration.

By default Spacemacs uses a dotfile called `~/.spacemacs` to control
which layers to load. Within this file you can also configure certain
features. First, split the window vertically to view both this tutorial
and the dotfile simultaneously (`SPC w /`). Open the dotfile by pressing
`SPC f e d`. Navigate to the line starting with
"dotspacemacs-configuration-layers". The following lines have further
instructions: uncomment `org` and `git` layers if you want to be
familiarized with them. More
[layers](https://github.com/syl20bnr/spacemacs/blob/develop/doc/LAYERS.org)
for different languages and tools can be found by pressing `SPC h SPC`.
The added layers will be installed upon restart of Spacemacs.

Some layers require third-party tools that you'll have to install via
your favorite package manager. The layer readme will tell if this is the
case.

Spacemacs는 구성을 구성 레이어라고 하는 자체 포함된 단위로 나눕니다. 이러한 레이어는 사용자 지정 구성을 달성하기 위해 서로의 위에 쌓입니다.

기본적으로 Spacemacs는 ~/.spacemacs로드할 레이어를 제어하기 위해 호출된 dotfile을 사용합니다. 이 파일 내에서 특정 기능을 구성할 수도 있습니다. 먼저 창을 세로로 분할하여 이 자습서와 도트 파일을 동시에 봅니다( SPC w /). 를 눌러 도트파일을 엽니다 SPC f e d. "dotspacemacs-configuration-layers"로 시작하는 줄로 이동합니다. 다음 줄에는 추가 지침이 있습니다. 주석 해제 org및 git레이어에 익숙해지려면 레이어를 제거하십시오. 를 누르면 다른 언어 및 도구에 대한 추가 레이어SPC h SPC 를 찾을 수 있습니다 . 추가된 레이어는 Spacemacs를 다시 시작할 때 설치됩니다.

일부 계층에는 즐겨 사용하는 패키지 관리자를 통해 설치해야 하는 타사 도구가 필요합니다. 이 경우 레이어 readme가 알려줍니다.

## Changing the colour theme

You can toggle the theme by `SPC T n`. This cycles between currently
activated themes. You can find more by adding the themes-megapack layer
and activate them by writing their names in the dotspacemacs-themes
list.

로 테마를 전환할 수 있습니다 SPC T n. 현재 활성화된 테마 사이를 순환합니다. theme-megapack 레이어를 추가하여 더 많은 것을 찾고 dotspacemacs-themes 목록에 이름을 작성하여 활성화할 수 있습니다.

## Starting maximized

Editing the `dotspacemacs-maximized-at-startup` variable from `nil` to
`t` will start Spacemacs maximized.

dotspacemacs-maximized-at-startup에서 변수를 편집하면 Spacemacs가 최대화되어 시작됩니다 nil.t

## Quitting

Save the changes you've made to the dotfile with `SPC f s` and then quit
emacs by `SPC q q`. You can return to this tutorial by clicking it on
the home screen!

# Additional features, tips and troubleshooting

## Org mode

Org mode is one of the best features of Spacemacs and enough reason to
warrant its use. Org mode's official description tells that it is "for
keeping notes, maintaining todo lists, planning projects, and authoring
documents with a fast and effective plain-text system", but this gives
only a small inkling of its versatility. If you do any kind of writing
at all, chances are that Org mode will make it easier and more fun. This
tutorial was written in Org mode.

To test some of it's features. Install the Org layer and open this
tutorial. Make a copy named `test.org` with `SPC f c` somewhere outside
of the `.emacs.d` directory. Press `SPC SPC`, write `org-mode` and press
`RET` to switch to `org-mode` from the write-only documentation mode.

Press `S-TAB` repeatedly and observe that this cycles the visibility of
the contents of different headlines. Press `SPC m T T` in normal mode
and observe that you can add TODO tags on headlines. (This can be
changed to just `t`, see the
[org](https://github.com/syl20bnr/spacemacs/blob/develop/layers/%2Bemacs/org/README.org#org-with-evil-org-mode)
layers documentation). Press `M-k` or `M-j` in normal mode and see how
you can quickly move parts of the document around.

This is not even scratching the surface of Org mode, so you should look
into [org
layer](https://github.com/syl20bnr/spacemacs/blob/develop/layers/%2Bemacs/org/README.org)
with `SPC h SPC org` for more information. Googling for Org mode
tutorials is also very helpful for finding out about the most useful
features!

조직 모드는 Spacemacs의 최고의 기능 중 하나이며 사용을 정당화하기에 충분한 이유입니다. Org 모드의 공식 설명은 "노트를 유지하고, 할 일 목록을 유지하고, 프로젝트를 계획하고, 빠르고 효과적인 일반 텍스트 시스템으로 문서를 작성하기 위한 것"이라고 말하지만 이것은 다용도성에 대한 작은 암시만 제공합니다. 어떤 종류의 글쓰기라도 한다면 조직 모드가 더 쉽고 재미있을 것입니다. 이 튜토리얼은 조직 모드에서 작성되었습니다.

그것의 기능 중 일부를 테스트합니다. 조직 계층을 설치하고 이 자습서를 엽니다. 디렉토리 외부에 이름 `test.org`이 지정된 사본을 만드십시오 . , 쓰기 및 를 눌러 쓰기 전용 문서 모드에서 전환합니다 . `SPC f c``.emacs.d``SPC SPC``org-mode``RET``org-mode`

`S-TAB`를 반복해서 누르고 이것이 다른 헤드라인의 내용의 가시성을 순환하는지 관찰하십시오 . 일반 모드에서 를 누르고 `SPC m T T`헤드라인에 TODO 태그를 추가할 수 있는지 확인합니다. (이것은 로 변경할 수 있습니다 . [조직](https://github.com/syl20bnr/spacemacs/blob/develop/layers/%2Bemacs/org/README.org#org-with-evil-org-mode) 계층 문서 `t`를 참조하십시오 .) 일반 모드에서 또는 를 누르고 문서의 일부를 빠르게 이동하는 방법을 확인하십시오.[](https://github.com/syl20bnr/spacemacs/blob/develop/layers/%2Bemacs/org/README.org#org-with-evil-org-mode)`M-k``M-j`

이것은 조직 모드의 표면을 긁지 않기 때문에 더 많은 정보를 위해 [조직 레이어](https://github.com/syl20bnr/spacemacs/blob/develop/layers/%2Bemacs/org/README.org) 를 살펴보아야 합니다. `SPC h SPC org`조직 모드 자습서에 대한 인터넷 검색도 가장 유용한 기능을 찾는 데 매우 유용합니다

## Version control - the intelligent way

Version control means keeping track of the changes and edits you have
made to your document. Often version control is done by saving different
versions of the document with different names, such as "document version
13" and so on. This is crude in many ways: if you want to, for example,
re-add something you deleted, you have to manually open several past
versions of the document to find the one with the deleted part, and then
copy-paste it to the most recent file. More complicated edits will be
harder still. Fortunately, there is a much better way. Git is the most
popular version control system for programmers, but it can be as useful
for people that are writing school or scientific papers, fiction or blog
posts as well.

Install the git layer, restart Spacemacs and open a file you want to
version control. You can check the status of your file by pressing
`SPC g s`. Select the folder your file is in. You will be prompted
whether you want to create a repository in the folder. Select yes. You
will see a list of "Untracked files": navigate to the file you want to
track and press s to "stage changes". You might be prompted to save the
file: save it if necessary. Now the new file needs to be committed:
press c and c again. Two windows pop up: one showing the changes you've
made since the last edit (in this case, the whole document) and another
prompting for a commit message. Write "Initial commit", press ESC to
exit back to normal mode and press `, c` confirm and quit the commit
message. To abort, press `, a`.

Now you know how to make a commit. The commits are saved in the (hidden)
.git folder in the same folder the tracked file(s) are in. You can make
further commits the same way.

버전 관리는 문서에 대한 변경 사항 및 편집 내용을 추적하는 것을 의미합니다. 종종 버전 제어는 "문서 버전 13" 등과 같은 다른 이름으로 문서의 다른 버전을 저장하여 수행됩니다. 이것은 여러 면에서 조잡합니다. 예를 들어 삭제한 항목을 다시 추가하려면 문서의 여러 이전 버전을 수동으로 열어 삭제된 부분이 있는 문서를 찾은 다음 복사하여 붙여넣어야 합니다. 가장 최근 파일. 더 복잡한 편집은 여전히 ​​더 어려울 것입니다. 다행히도 훨씬 더 좋은 방법이 있습니다. Git은 프로그래머에게 가장 인기 있는 버전 관리 시스템이지만 학교나 과학 논문, 소설 또는 블로그 게시물을 작성하는 사람들에게도 유용할 수 있습니다.

git 레이어를 설치하고 Spacemacs를 다시 시작한 다음 버전 관리하려는 파일을 엽니다. 를 눌러 파일 상태를 확인할 수 있습니다 `SPC g s`. 파일이 있는 폴더를 선택합니다. 폴더에 리포지토리를 만들 것인지 묻는 메시지가 표시됩니다. 예를 선택합니다. "추적되지 않은 파일" 목록이 표시됩니다. 추적하려는 파일로 이동하고 s를 눌러 "변경 사항 단계"를 수행합니다. 파일을 저장하라는 메시지가 표시될 수 있습니다. 필요한 경우 저장합니다. 이제 새 파일을 커밋해야 합니다. c와 c를 다시 누릅니다. 두 개의 창이 나타납니다. 하나는 마지막 편집(이 경우 전체 문서) 이후 변경한 내용을 표시하고 다른 하나는 커밋 메시지를 표시합니다. "초기 커밋"이라고 쓰고 ESC를 눌러 일반 모드로 돌아가고 ~, c~를 눌러 확인하고 커밋 메시지를 종료합니다. 중단하려면 ~, ~를 누르십시오.

이제 커밋하는 방법을 알았습니다. 커밋은 추적된 파일이 있는 동일한 폴더의 (숨겨진) .git 폴더에 저장됩니다. 같은 방식으로 추가 커밋을 수행할 수 있습니다.

## Daemon mode and instant startup (Linux)

Emacs can be used in daemon mode: a daemon runs in the background and
launches clients. This way new frames launch instantly without delay.
[Emacswiki](https://www.emacswiki.org/emacs/EmacsAsDaemon) tells more
about the daemon and how to set it to launch automatically on startup.

Emacs는 데몬 모드에서 사용할 수 있습니다. 데몬은 백그라운드에서 실행되고 클라이언트를 시작합니다. 이렇게 하면 새 프레임이 지연 없이 즉시 시작됩니다. [Emacswiki](https://www.emacswiki.org/emacs/EmacsAsDaemon) 는 데몬과 시작 시 자동으로 실행되도록 설정하는 방법에 대해 자세히 설명합니다.

데몬으로 띄워놓고 써야 VIM 처럼 쓸 수있다. 
Setting up Emacs As a Daemon in Ubuntu
https://medium.com/@nevinvalsaraj/setting-up-emacs-as-a-daemon-in-ubuntu-20-04-6c4f8c441a83


## Swap caps lock and esc keys on your keyboard

이것은 Spacemacs 외부에서도 유용합니다!


## Troubleshooting and further info

`SPC ?` shows you the key bindings in the current major mode, which is
often helpful. For troubleshooting, please refer to the
[FAQ](https://github.com/syl20bnr/spacemacs/blob/develop/doc/FAQ.org) by
pressing `SPC h f`. More help is found under `SPC h`, and with
`SPC h SPC` you can access the comprehensive Spacemacs documentation,
including this tutorial and the layer documents.

The [Gitter chat](https://gitter.im/syl20bnr/spacemacs) can be used to
ask questions if the answer cannot be found in the documentation. For a
detailed review of Spacemacs's features one can also watch the
[Spacemacs ABC
series](https://www.youtube.com/playlist?list=PLrJ2YN5y27KLhd3yNs2dR8_inqtEiEweE)
by Eivind Fonn on Youtube. Some of the keybindings have changed since
the videos were uploaded but seeing someone in action helps spot helpful
tricks that would otherwise be missed.


`SPC ?`종종 도움이 되는 현재 주요 모드의 키 바인딩을 보여줍니다. 문제 해결은 를 눌러 [FAQ](https://github.com/syl20bnr/spacemacs/blob/develop/doc/FAQ.org) 를 참조하세요 `SPC h f`. 추가 도움말은 에서 찾을 수 `SPC h`있으며 `SPC h SPC`이 튜토리얼과 레이어 문서를 포함한 포괄적인 Spacemacs 문서에 액세스할 수 있습니다.

문서 에서 답변을 찾을 수 없는 경우 [Gitter 채팅](https://gitter.im/syl20bnr/spacemacs) 을 사용하여 질문할 수 있습니다. Spacemacs의 기능에 대한 자세한 리뷰를 보려면 Youtube에서 Eivind Fonn의 [Spacemacs ABC 시리즈 를 시청할 수도 있습니다.](https://www.youtube.com/playlist?list=PLrJ2YN5y27KLhd3yNs2dR8_inqtEiEweE)동영상이 업로드된 이후로 키 바인딩 중 일부가 변경되었지만 다른 사람이 작동하는 모습을 보면 놓칠 수 있는 유용한 트릭을 찾는 데 도움이 됩니다.