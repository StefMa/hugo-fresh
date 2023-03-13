---
title: Landing page
sidebar: true
sidebarlogo: fresh-white
include_footer: false
---

## Customize the landing page
There's a wide variety of customizations that you can make to your Hugo Fresh landing page by modifying the `hugo.yaml` file that you downloaded.

> **Note**: There is always an up-to-date config file at [`exampleSite/hugo.yaml`](https://github.com/StefMa/hugo-fresh/blob/master/exampleSite/hugo.yaml) that contains all possible configurations.
Please make sure you check them out as well.

{{< title4 preloader >}}
Preloader ensures images are loaded before displaying to the user.
If you don't want it, set it to `false`.

```yaml
preloader: false
```

{{< title4 navbarlogo >}}
Define the logo of the navigation bar in the upper left corner.

<details>
<summary>Code</summary>

```yaml
navbarlogo:
 image: logos/fresh.svg # Logo (from static/images/logos/)
 link: /
```

</details>

{{< title4 font >}}
Set the font of the site.

<details>
<summary>Code</summary>

```yaml
font:
  name: "Open Sans"
  sizes: [400,600]
```

</details>

{{< title4 hero >}}
The "main" page which you see when you open the website.

<details>
<summary>Code</summary>

```yaml
hero:
  title: Manage. Deploy.
  subtitle: Lorem ipsum sit dolor amet is dummy text used by the typography industry
  buttontext: Get started
  buttonlink: "#"
  image: illustrations/worker.svg
  # Footer logos (from static/images/logos/clients/*.svg)
  # urls are optional
  clientlogos:
  - logo: systek
    url: https://google.com
  - logo: tribe
    url: https://stefma.github.io/hugo-fresh/
  - logo: kromo
    url: https://github.com/StefMa/hugo-fresh
  - logo: infinite
    url: https://hugo-fresh.vercel.app/
  - logo: gutwork
    url: https://bulma.io/
```

</details>

{{< title4 navbar >}}
The navigation bar which is at the top of the site.
For a dropdown, add a "sublinks" list.

<details>
<summary>Code</summary>

```yaml
navbar:
- title: Features
  url: /
- title: Pricing
  url: /
- title: Dropdown
  sublinks:
  - title: Dropdown item
    url: /
  - title: Dropdown item
    url: /
  - title: Dropdown item
    url: /
- title: Log in
  url: /
- title: Sign up
  url: /
  button: true
```

</details>

{{< title4 sidebar >}}
The sidebar is an optional parameter where you can place even more navigation items.

<details>
<summary>Code</summary>

```yaml
sidebar:
  # Logo (from /images/logos/___.svg)
  logo: fresh-square
  sections:
  - title: User
    icon: user
    links:
    - text: Profile
      url: /
    - text: Account
      url: /
    - text: Settings
      url: /
  - title: Messages
    icon: envelope
    links:
    - text: Inbox
      url: /
    - text: Compose
      url: /
  - title: Images
    icon: image
    links:
    - text: Library
      url: /
    - text: Upload
      url: /
  - title: Settings
    icon: cog
    links:
    - text: User settings
      url: /
    - text: App settings
      url: /
```

</details>

{{< title4 section1 >}}
Describes the second "page" which you will see when you scroll down. Currently it will have **always** three `titles`.

<details>
<summary>Code</summary>

```yaml
section1:
  title: Great power comes
  subtitle: with great responsibility
  tiles:
  - title: App builder
    icon: mouse-globe
    text: This is some explanatory text that is on two rows
    url: /
    buttonText: Free trial
  - title: Cloud integration
    icon: laptop-cloud
    text: This is some explanatory text that is on two rows
    url: /
    buttonText: Get started
  - title: Add-ons & plugins
    icon: plug-cloud
    text: This is some explanatory text that is on two rows
    url: /
    buttonText: Get started
```

</details>

{{< title4 section2 >}}
Shows information why someone should use this product.

<details>
<summary>Code</summary>

```yaml
section2:
  title: You're here because you want the best
  subtitle: And we know it
  features:
  - title: Powerful and unified interface
    text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
    # Icon (from /images/illustrations/icons/___.svg)
    icon: laptop-globe
  - title: Cross-device synchronisation
    text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
    icon: doc-sync
  - title: Nomad system
    text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
    icon: mobile-feed
```

</details>

{{< title4 section3 >}}
Display a bright image of your product.

<details>
<summary>Code</summary>

```yaml
section3:
  title: One platform
  subtitle: To rule them all
  image: illustrations/mockups/app-mockup.png
  buttonText: Get started
  buttonLink: "#"
```

</details>

{{< title4 section4 >}}
What clients says about us.

<details>
<summary>Code</summary>

```yaml
section4:
  title: Our Clients love us!
  subtitle: Lorem ipsum sit dolor amet is a dummy text used by typography industry
  clients:
  - name: Irma Walters
    quote: Lorem ipsum dolor sit amet, elit deleniti dissentias quo eu, hinc minim appetere te usu, ea case duis scribentur has. Duo te consequat elaboraret, has quando suavitate at.
    job: Accountant
    img: 1 # From (static/images/illustrations/faces)
  - name: John Bradley
    quote: Lorem ipsum dolor sit amet, elit deleniti dissentias quo eu, hinc minim appetere te usu, ea case duis scribentur has. Duo te consequat elaboraret, has quando suavitate at.
    job: Financial Analyst
    img: 2
  - name: Gary Blackman
    quote: Lorem ipsum dolor sit amet, elit deleniti dissentias quo eu, hinc minim appetere te usu, ea case duis scribentur has. Duo te consequat elaboraret, has quando suavitate at.
    job: HR Manager
    img: 3
```

</details>

{{< title4 section5 >}}
Write us.

<details>
<summary>Code</summary>

```yaml
section5:
  title: Drop us a line or two
  subtitle: We'd love to hear from you
  buttonText: Send Message
  action: https://formspree.io/f/{ID}
  method: POST
```

</details>

{{< title4 footer >}}
The footer of the site.

<details>
<summary>Code</summary>

```yaml
footer:
  # Logo (from /staticimages/logos/___)
  logo: fresh-white-alt.svg
  # Social media links (GitHub, Twitter, etc.). All are optional.
  socialmedia:
  - link: https://github.com/StefMa/hugo-fresh
    # Icons are from Font Awesome
    icon: github
  - link: https://dribbble.com/#
    icon: dribbble
  - link: https://facebook.com/#
    icon: facebook
  - link: https://twitter.com/lucperkins
    icon: twitter
  - link: https://bitbucket.org/#
    icon: bitbucket
  bulmalogo: true
  quicklinks:
    column1:
      title: "Product"
      links:
      - text: Discover features
        link: /
      - text: Why choose our product?
        link: /
      - text: Compare features
        link: /
      - text: Our roadmap
        link: /
      - text: AGB
        link: /agb
    column2:
      title: "Docs"
      links:
      - text: Get started
        link: /
      - text: User guides
        link: /
      - text: Admin guide
        link: /
      - text: Developers
        link: /
    column3:
      title: "Blog"
      links:
      - text: Latest news
        link: /blog/first
      - text: Tech articles
        link: /blog/second
```

</details>
