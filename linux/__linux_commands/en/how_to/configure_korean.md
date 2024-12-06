* Rev.2: 2020-06-29 (Mon)
* Rev.1: 2020-06-23 (Tue)
* Draft: 2019-10-10 (Tue)
# How to Configure Korean on Ubuntu (18.04)
## 1. Open the `Settings > Region & Language` menu
There are two ways to open the menu.

### 1.1. Click and move to the `Region & Language` menu
Click the dropdown menu, `Settings` and then `Region & Language`

#### Step 1. Click the down arrow on the top right corner.
<img src="images/ubuntu_18_04-top_right_corner-menu.png">

#### Step 2. Click the `Settings` icon on the left bottom of the dropdown menu.
<img src="images/ubuntu_18_04-drop_down_menu-icons-settings.png">

#### Step 3. Click `Region & Language` on the left menu (when the `Settings` window is open)
<img src="images/ubuntu_18_04-settings-region_and_language.png">

### 1.2. Search and launch the `Region & Language` menu
Click `Show Applications`, search for `Region & Language` and click 

#### Step 1. Click the `Show Applications` menu on the bottom left corner.
<img src="images/ubuntu_18_04-show_applications_button.png">

And the following menu is open.
<img src="images/ubuntu_18_04-show_applications-menu.png">

#### Step 2. Search for `Region & Language` in the search box
And the search results are shown like below.
<img src="images/ubuntu_18_04-show_applications-search_box-region-result.png">

#### Step 3. Click `Region & Language` next to `Settings`
And the `Region & Language` window is launched.

<img src="images/ubuntu_18_04-settings-region_and_language.png">

## 2. Install language packs
### 2.1. Install the language packs with GUI
In `Settings > Region & Language` presented above, click `Manage Installed Languages` 

<img src="images/ubuntu_18_04-settings-region_and_language-cropped.png">

to launch the `Language Support` window shown below.

<img src="images/ubuntu_18_04-settings-region_and_language-manage_installed_languages-language_support.png">

A pop-up window `The language support is not installed completely` may open when the `Language Support` window is open for the first time. If so, click `install` and install the language support completely.

<img src="images/ubuntu_18_04-language_support-the_language_support_is_not_installed_completely.png">

Back to the `Language Support` window, click the `Install/Remove Languages...` button and the `Installed languages` are shown.
<img src="images/ubuntu_18_04-settings-region_and_language-manage_installed_languages-initial_window.png">

Scroll down to find `Korean`, check the box for Korean, and click the `Apply` button.
<img src="images/ubuntu_18_04-language_support-installed_languages-korean.png">

The `Applying changes` window pops up and installation begins. Wait until the installation is complete.

### 2.2. Install the language packs with CLI (Command Line Interface)
Alternatively, you may run the following commands in the terminal.
```bash
$ sudo apt install -y language-pack-ko
$ sudo apt install -y korean*
```

[TODO: I think these commands are not enough to set up everything. But I keep it here at any rate for the future chance to revise this article.]

A pop-up window `The language support is not installed completely` may open when the `Language Support` window is open for the first time. If so, click `install` and install the language support completely.

<img src="images/ubuntu_18_04-language_support-the_language_support_is_not_installed_completely.png">

## 3. Reboot the system

In the previous step, the language packs are installed. When the installation is complete, reboot the system.

* Do reboot the system.
* Do not `Log out & log back in`. 
  * I've seen web articles to `log out & log back in` which didn't work and wasted another 30 minutes or so.

## 4. Verify if the language packs are installed.
After the reboot, go to `Settings > Region & Language` and click `Manage Installed Languages`. In the `Language Support` window, scroll down `Language for menus and windows` under the `Language` tab to make sure Korean is added in the 'Language Support' window.

<img src="images/ubuntu_18_04-language_support-language-korean.png">

Note there will be a problem in the next step where IBus is configured if the language pack is not installed properly. There will be no search result with `Korean` in the next step while Korean needs to be selected.

<img src="images/ubuntu_18_04-ibus_preferences-input_method-add-search-korean-no_search_result.png">

## 5. Configure IBus to add `Korean (Hangul)` as an `Input Method`

#### Step 1. Set `Keyboard input method system` in the bottom to `IBus`
<img src="images/ubuntu_18_04-settings-region_and_language-manage_installed_languages-language_support.png">

#### Step 2. Open a terminal with `Ctrl+Alt+t` and launch the `IBus Preferences` window.
Note this window cannot be launched from the `Settings > Region & Language` menu.
```bash
$ ibus-setup
```
<img src="images/ubuntu-configure_korean-ibus_preferences-launch_window.png">

#### Step 3. Click the `Input Method` tab
<img src="images/ubuntu_18_04-ibus_preferences-input_method.png">

#### Step 4. Click the `Add` button
`IBus Preferences > Input Method -> Add` launches the `Select an input method` window.
<img src="images/ubuntu_18_04-ibus_preferences-input_method-add.png">

#### Step 5. Click the vertical dots `...` and a search box shows up.

<img src="images/ubuntu_18_04-ibus_preferences-input_method-add-select_an_input_method-search_box.png">

#### Step 6. Enter 'Korean' to the search box and the matching search result shows up. 

<img src="images/ubuntu_18_04-ibus_preferences-input_method-add-select_an_input_method-search_box-korean.png">

The above figure shows the case when there exists `Korean` in the search result. If no result is shown, 

<img src="images/ubuntu_18_04-ibus_preferences-input_method-add-search-korean-no_search_result.png">

Something was wrong with the previous step(s) when the language packs are installed. Go back to the previous step and fix the problem(s) first.

Step Select 'Korean' and add `Hangul`

#### Step 7. Click `Korean` and `Hangul` is shown.

<img src="images/ubuntu_18_04-ibus_preferences-input_method-add-select_an_input_method-search_box-korean-hangul.png">

#### Step 8. Select `Hangul` and click the `Add` button.

<img src="images/ubuntu_18_04-ibus_preferences-input_method-add-select_an_input_method-search_box-korean-hangul-highlighted.png">

And `Korean-Hangul` is added to the input method.

<img src="images/ubuntu_18_04-ibus_preferences-input_method-korean-hangul.png">

Click the `Close` button and the above window is closed.

## 6. Add `Korean (Hangul)` to the `Input Source` list

Notice the previous step adds `Korean (Hangul)` as an Input method to `IBus` and this step adds it as an `Input Source` to `Settings > Region & Language`.

#### Step 1. Go back to `Settings > Region & Language`

Notice the `Input Sources` has `English(US)` only.

<img src="images/ubuntu_18_04-settings-region_and_language-cropped_the_bottom_part.png">

#### Step 2. Click the `+` button in the `Input Sources` section.

And the `Add an Input Source` windows pops up.

<img src="images/ubuntu_18_04-settings-region_and_language-add_an_input_source.png">

#### Step 3. Click the vertical dots `...` and a search box shows up.

<img src="images/ubuntu_18_04-settings-region_and_language-add_an_input_source-search_box.png">

#### Step 4. Enter `Korean` to the search box.

<img src="images/ubuntu_18_04-settings-region_and_language-add_an_input_source-search_box-korean.png">

#### Step 5. Click `Korean` in the list and the list of supported input sources are shown.

<img src="images/ubuntu_18_04-settings-region_and_language-add_an_input_source-korean-list_of_supported_input_sources.png">

#### Step 6. Select `Korean (Hangul)` and the `Add` button is highlighted in green. 

<img src="images/ubuntu_18_04-settings-region_and_language-add_an_input_source-search_box-korean-add_highlighted.png">

#### Step 7. Click the `Add` button 

And `Korean (Hangul)` is added to the `Input Sources` list.

<img src="images/ubuntu_18_04-settings-region_and_language-korean_hangul_is_added.png">

## 7. Verify and use the Korean input system
### How to switch the input languages
Press the `Super+Space` key (`Ctrl+Space` in some cases) to switch the language from English to Korean.

To see the instructions, open the `Input Source Options` window. Go to `Settings > Region & Language` and click the `Options` button in the `Input Sources` section.

<img src="images/ubuntu_18_04-settings-region_and_language-input_sources-options.png">

### How to check the current input language
On the top right corner, the current input language is shown as an icon.
### When `English(US)` is the input language
`en` icon is shown.

<img src="images/ubuntu_18_04-gui-language_input_source.png">

Click the `en` icon and you can check the full information on the input language.

<img src="images/ubuntu_18_04-gui-language_input_source-english_us.png">

### When `Korean(Hangul)` is the input language
`EN` icon is shown, but `Korean(Hangul)` is selected.

<img src="images/ubuntu_18_04-gui-language_input_source-korean_hangul.png">

This is weird, but it will make sense with a little bit explanation. The Korean input system supports both English and Korean. An additional key `한/영` exists on every keyboard made in Korea. This key helps switching the two languages quickly. To sum, it's a two-step process to switch the language from English to Korean. 

Step 1. Switch to the `Korean` mode by pressing the `Super+Space` key.

Step 2. Press the `한/영` key to switch the input language between `English` and `Korean`.

Step 3. Open a text editor and input some Korean characters.

<img src="images/ubuntu_18_04-terminal-text_in_korean.png">

[I don't like this. Ubuntu should fix this problem. ]

The way I walk around this problem is that I keep my input language to the `Korean` mode all the time and use the `한/영` key to switch between `English` and `Korean`. 

### Opening the `IBusHangul Setup`
To set up `IBus Hangul`, click the language icon and the drop-down menu for the input language is shown.

<img src="images/ubuntu_18_04-gui-korean_dropdown_menu.png">

Click `Setup` to open the `IBusHangul Setup` window.

<img src="images/ubuntu_18_04-ibushangul_setup.png">

You can play around with this.

### Turning on the Hangul Mode
In the drop-down menu, it is possible to turn on the hangule mode.

<img src="images/ubuntu_18_04-gui-language_input_source-hangul_mode-on.png">

The problem is this mode is reset when I switched back to English by pressing the `Super+Space` buttons.

<img src="images/ubuntu_18_04-gui-korean_dropdown_menu.png">

[TODO: Fix this. I have to leave it as it is for now.]

## Troubleshoot
만약 설치를 끝내고 난 후에도 목록에 한국어가 없다면 Install/Remove Languages에서 설치된 Korean을 지우고 동일한 방법으로 설치하시면 됩니다.

## References
* [[Ubuntu] Ubuntu 18.04 LTS 한글 설치 및 설정](https://gabii.tistory.com/entry/Ubuntu-1804-LTS-%ED%95%9C%EA%B8%80-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%84%A4%EC%A0%95)
* [[UBUNTU] 18.04에서 한글 입력 및 한영키 사용](https://tobelinuxer.tistory.com/15)
* [[Ubuntu 18.04] 한글 입력 추가 및 한영키 사용 설정](https://greedywyatt.tistory.com/105)
