# IPv6 Leading Zero, Zero Suppression, Zero Compression

## 🔢 1. **Leading Zero**

**Definition**: A **leading zero** is any `0` digit that appears **at the beginning** of a number, before any non-zero digit.

**Examples**:

* `007` → Has two leading zeros.
* `000123` → Has three leading zeros.
* `0.56` → `0` before the decimal is also considered a leading zero in decimal notation.

**Use Cases**:

* Often used in formatting (e.g., `09` for September).
* Necessary in fixed-length fields (e.g., in programming, ID numbers, timestamps).

## ❌ 2. **Zero Suppression**

**Definition**: **Zero suppression** ==means **removing unnecessary zeros** (usually leading or trailing zeros) that don't affect the value of the number.==

**Types**:

* **Leading zero suppression**: Removing zeros at the start.

  * `00045` → `45`
* **Trailing zero suppression** (after decimal):

  * `12.34000` → `12.34`

## 🗜️ 3. **Zero Compression**

**Definition**: In computing and data transmission, **zero compression** refers to **replacing consecutive zeros** with a shorthand to reduce data size.

**Common Use Case**: **IPv6 addresses**

In IPv6, zero compression is used to shorten addresses by using `::` to replace one or more groups of zeros.

**Example**:

* Full IPv6: `2001:0db8:0000:0000:0000:ff00:0042:8329`
* After zero compression: `2001:db8::ff00:42:8329`


---

# 🌐 Multicast Neighbor Solicitation (NS) — IPv6 Networking

**Neighbor Solicitation** is a key part of the **Neighbor Discovery Protocol (NDP)** in **IPv6**. It's used to discover neighbors (other devices) on the same local network, and determine their **link-layer (MAC) addresses** — similar to **ARP** in IPv4.

## 📌 What Is Multicast Neighbor Solicitation?

**Multicast Neighbor Solicitation** is when an IPv6 host sends a **Neighbor Solicitation message** to a **multicast address** to resolve the **MAC address of another IPv6 device** on the same network.

It’s used when:

* A device wants to learn the MAC address of an IPv6 address (like ARP in IPv4).
* Duplicate Address Detection (DAD) checks if an IPv6 address is already in use.

## 🔄 How It Works

### 1. **Device A wants to communicate with Device B**

* Device A knows B’s **IPv6 address**, but **not its MAC address**.

### 2. **Device A sends a Neighbor Solicitation message**

* Sent to a **multicast address**, not a broadcast.
* The target is **Device B’s solicited-node multicast address** (more on that below).

### 3. **Device B replies with a Neighbor Advertisement**

* This message contains B’s **MAC address**.
* Device A stores this info in its **neighbor cache** (like an ARP table).

## 📫 Multicast Address Used

The Neighbor Solicitation is sent to a **Solicited-Node Multicast Address**, which is derived from the target IPv6 address:

**Format:**

```
FF02::1:FFXX:XXXX
```

* The last 24 bits (6 hex digits) of the **target IPv6 address** are used to form this multicast address.
* This makes it more efficient than broadcast (used in IPv4 ARP), since only relevant devices process the packet.

**Example:**

IPv6 target: `fe80::abcd:ef12:3456:789a`

Last 24 bits of Interface ID: `56:789a`
Multicast address: `ff02::1:ff56:789a`

### 🛠️ Use Cases

| Use Case                              | Description                                                                     |
| ------------------------------------- | ------------------------------------------------------------------------------- |
| **Address Resolution**                | Resolve the MAC address of a known IPv6 address.                                |
| **Duplicate Address Detection (DAD)** | Check if an IPv6 address is already in use before assigning it to an interface. |
| **Neighbor Unreachability Detection** | Verify if a neighbor is still reachable.                                        |

### ✅ Summary

| Feature         | IPv6 Neighbor Solicitation                        |
| --------------- | ------------------------------------------------- |
| Protocol        | ICMPv6 (type 135)                                 |
| Purpose         | Resolve MAC addresses, check address usage        |
| Target          | Solicited-node multicast address                  |
| Replacement For | ARP in IPv4                                       |
| Efficient?      | Yes — limited multicast instead of full broadcast |

---

# VoIP

**VoIP** stands for **Voice over Internet Protocol**. It's a technology that allows you to make voice calls using an internet connection instead of a regular (analog) phone line.

## Key Features of VoIP:

* **Internet-based**: Works over Wi-Fi, mobile data, or Ethernet.
* **Lower Cost**: Often cheaper than traditional phone services, especially for international calls.
* **Flexible Devices**: Can be used on smartphones, computers, VoIP phones, or even traditional phones with adapters.
* **Advanced Features**: Call forwarding, voicemail to email, video calls, virtual numbers, and more.

## How It Works:

1. Your voice is converted into digital data.
2. The data is compressed and transmitted over the internet.
3. The receiving end decodes the data and plays the audio.

---

# Dnscmd /config /GlobalQueryBlockList wpad

## 📌 What it does:

This command is used to **configure the DNS server** on Windows to **block requests for "WPAD"** (Web Proxy Auto-Discovery Protocol) by adding it to the **Global Query Block List**.

## 🔐 Why is this important?

**WPAD** is a protocol that can be abused in **man-in-the-middle attacks**, especially in corporate or public networks. Attackers can set up fake WPAD servers to redirect traffic through malicious proxies. To mitigate this risk, system administrators often block "wpad" DNS queries on internal DNS servers.

So:

* `Dnscmd` – A Windows command-line tool to manage DNS servers.
* `/config` – Tells the tool to configure a setting.
* `/GlobalQueryBlockList` – The DNS setting being modified.
* `wpad` – The name being added to the blocklist.


## ✅ Usage Example:

To block both `wpad` and `isatap` (another often-blocked name), you might use:

```
Dnscmd /config /GlobalQueryBlockList wpad isatap
```

> Note: This command must be run **on a Windows DNS server** with **administrative privileges**.

# `%` symbol in IPv6 addresses*

The **`%` symbol in IPv6 addresses** is known as the **zone index** or **scope ID**.

## 🔍 Example:

```
fe80::1%eth0
```

or

```
fe80::1%3
```

## 💡 What it means:

The `%` indicates the **interface or scope** through which the IPv6 address should be accessed. It's **mainly used with link-local addresses**, which are only valid on the local link (not routable across networks).

## 📘 Why is it needed?

==Link-local addresses (starting with `fe80::`) can be the **same** on multiple interfaces.== To send packets to the correct network interface, the system needs to know **which interface** to use.

## 👇 Two common formats:

| Example        | Meaning                                                     |
| -------------- | ----------------------------------------------------------- |
| `fe80::1%eth0` | Use the interface named `eth0`                              |
| `fe80::1%3`    | Use the interface with index `3` (OS-specific index number) |


## ✅ Reason for the space:

The space separates the **command** (`Dnscmd`) from its **arguments** (`/config /GlobalQueryBlockList wpad`).


### 🧠 TL;DR:

* The space is **not extra** or a mistake.
* ==It’s required to properly separate the command and its arguments.==
* This is the correct usage:

  ```
  Dnscmd /config /GlobalQueryBlockList wpad
  ```

Let me know if you want a breakdown of how each argument works or how to verify the block list.

---

# Format-Table in powershell

In PowerShell (`ps`), the `Format-Table` cmdlet is used to **format output as a table**, making it easier to read and compare properties of objects.


### 📌 Typical Use:

```powershell
Get-Process | Format-Table Name, Id, CPU
```

This displays the `Name`, `Id`, and `CPU` columns from the `Get-Process` output.

### ⚠️ Important Notes:

* `Format-Table` is **used for display only**. It converts objects into text for output.
* Once you've used `Format-Table`, **you can't pipe the result to another command** expecting objects — it’s just formatted text now.

Bad (loses object structure):

```powershell
Get-Process | Format-Table Name, Id | Where-Object { $_.Id -gt 1000 }  # ❌ Won't work
```

Good:

```powershell
Get-Process | Where-Object { $_.Id -gt 1000 } | Format-Table Name, Id  # ✅ Works
```

---

# Format-list in powershell

### 📘 Basic Syntax:

```powershell
Get-Process | Format-List
```

This displays all properties of each process, one per line, like:

```
Name       : chrome
Id         : 1234
CPU        : 45.62
...
```

---

## 🔍 Use Cases:

==* When you want to **see all properties** of an object clearly.==
* When **property values are too wide** to fit in a table (`Format-Table` may truncate them).
* For better **readability** when working with objects that have many fields.

## 🔧 Other useful options:

| Option        | Description                                    |
| ------------- | ---------------------------------------------- |
| `-Property *` | Shows **all properties** of the object         |
| `-GroupBy`    | Groups list output by a property               |
| `-Force`      | Shows **hidden** or **non-default** properties |

#### Example:

```powershell
Get-Process | Format-List -Property *  # Shows all props
```


### ⚠️ Like `Format-Table`:

Once you use `Format-List`, you're formatting for **output only** — the result is **text**, not objects anymore.

Bad (won't work):

```powershell
Get-Process | Format-List Name | Where-Object { $_.Name -eq "chrome" }  # ❌
```

Good:

```powershell
Get-Process | Where-Object { $_.Name -eq "chrome" } | Format-List Name  # ✅
```

---

# Router Solicitation & Router 

TODO:

**Router Solicitation (RS)** and **Router Advertisement (RA)** are part of the **IPv6 Neighbor Discovery Protocol (NDP)** — they help devices **discover routers** and **configure themselves** on an IPv6 network (often without DHCP).

## 🔄 TL;DR Summary:

| Term                          | Sent By                      | Purpose                                                     | Destination                                        |
| ----------------------------- | ---------------------------- | ----------------------------------------------------------- | -------------------------------------------------- |
| **Router Solicitation (RS)**  | Host (computer, phone, etc.) | "Hey, are there any routers out there?"                     | Sent to all-routers multicast (`ff02::2`)          |
| **Router Advertisement (RA)** | Router                       | "Yes, I’m a router. Here’s info like prefix, DNS, gateway." | Sent to all-nodes multicast (`ff02::1`) or unicast |


## 🔧 How It Works (Step-by-Step):

### 1. **Host joins the network**

* It has **no IPv6 address**, no idea who the router is.
* It sends a **Router Solicitation (RS)** to the multicast address `ff02::2` (all routers).

### 2. **Router responds**

* The router sends a **Router Advertisement (RA)**.
* This can include:

  * **Prefix** for SLAAC (automatic IP configuration)
  * **Default gateway**
  * **MTU (Maximum Transmission Unit)**
  * **DNS information** (via RDNSS)
  * Whether the host should use **DHCPv6**

### 3. **Host configures itself**

* Using the info in the RA, the host assigns itself an IPv6 address and can reach the internet or internal services.

## 📡 Message Types (ICMPv6):

| Message Type | Name                      | Code | Sent By |
| ------------ | ------------------------- | ---- | ------- |
| `133`        | Router Solicitation (RS)  | 0    | Host    |
| `134`        | Router Advertisement (RA) | 0    | Router  |

---

## 📘 Extra Notes:

* RAs are often **periodically sent** even without RS, so hosts can automatically discover routers.
* You can block or spoof RAs — it's a **vector for attacks** like **Rogue Router Advertisement** (used in IPv6-based MITM attacks).
* In Windows, Linux, etc., you can see this traffic with:

  ```bash
  sudo tcpdump -i eth0 icmp6
  ```

## 🛠 Example Command (Linux):

```bash
rdisc6 eth0
```

→ Sends an RS and displays the RA response.

---

# Microsoft Message Analyzer

Microsoft Message Analyzer (MMA) was retired and its download packages removed from microsoft.com sites on November 25 2019.  There is currently no Microsoft replacement for Microsoft Message Analyzer in development at this time.  For similar functionality, ==please consider using a 3rd party network protocol analyzer tool such as Wireshark.==

---

# (Get-VMIntegrationService -VMName "20741B-LON-DC1" | Where-Object Name -like "活動訊號").Enabled

Sure! Let's break down and elaborate on the PowerShell command:

```powershell
(Get-VMIntegrationService -VMName "20741B-LON-DC1" | Where-Object Name -like "活動訊號").Enabled
```

This PowerShell command is querying the **status of a specific Hyper-V integration service** for a virtual machine (VM) named **"20741B-LON-DC1"**. Let’s go through it piece by piece:

---

### 🔧 1. `Get-VMIntegrationService -VMName "20741B-LON-DC1"`

* **Purpose**: This cmdlet retrieves all **integration services** associated with the specified VM.
* **VMName**: `"20741B-LON-DC1"` is the name of the virtual machine you're querying.
* **Output**: A list of integration services for that VM, such as:

  * Operating System Shutdown
  * Time Synchronization
  * Data Exchange
  * Heartbeat ("活動訊號" in Traditional Chinese)
  * Backup (Volume Shadow Copy)
  * Guest Services

### 🔍 2. `| Where-Object Name -like "活動訊號"`

* ==**Purpose**: Filters the list of integration services.==
* **Name -like "活動訊號"**:

  * `Name` is the name of the integration service.
  * `"活動訊號"` translates to **"Heartbeat"** in English.
  * The `-like` operator is used for pattern matching. In this case, it's a direct match for "活動訊號".

So this part filters out just the **Heartbeat integration service** from the list.

---

# Running State v.s. Heartbeat

Excellent question — understanding the difference between **`State: Running`** and **`Heartbeat: OK`** in Hyper-V is crucial for scripting, automation, and troubleshooting.

Let’s break it down clearly:

---

## 🖥️ 1. `State: Running` (VM Status)

This indicates the **power state** of the virtual machine — similar to a physical PC being turned on.

### ✅ What it means:

* The VM is powered on.
* Hyper-V has allocated resources (CPU, memory, etc.).
* The guest OS **may or may not** be fully booted yet.
* Hyper-V doesn’t know if the OS inside is responsive — just that it’s running.

> **Example:** A VM could be in `Running` state while still stuck on a BIOS screen or booting slowly.

---

## ❤️ 2. `Heartbeat: OK` (Integration Services Status)

This comes from the **Heartbeat Integration Service**, one of several tools built into Hyper-V to monitor guest OS health.

### ✅ What it means:

* The **guest OS has fully booted**.
* The **Hyper-V Integration Services are running** in the guest OS.
* The guest OS is **responsive and able to communicate** with the host via the heartbeat signal.

> Think of it like a “ping” from inside the VM to the Hyper-V host, sent at regular intervals.

---

### 🆚 Comparison Table

| Aspect                             | `State: Running`             | `Heartbeat: OK`                                  |
| ---------------------------------- | ---------------------------- | ------------------------------------------------ |
| What it checks                     | VM power status              | Guest OS health & responsiveness                 |
| Level                              | Hypervisor-level             | OS-level (via integration services)              |
| OS fully booted?                   | Not guaranteed               | Yes                                              |
| Integration Services?              | Not required                 | Required                                         |
| Useful for…                        | Basic automation, start/stop | Health checks, readiness for workloads           |
| Can be "Running" but no Heartbeat? | ✅ Yes (e.g., OS is stuck)    | ❌ No, if heartbeat is OK, OS is running properly |

---

## 💡 Practical Use:

* If you just want to **know the VM is on**, use `State -eq 'Running'`.
* If you want to **do something only after the OS is fully booted and responsive**, check for `Heartbeat -eq 'OK'`.

---

**6to4** is an **IPv6 transition mechanism** that allows IPv6 packets to be transmitted over an IPv4 network. It was designed to help with the gradual shift from IPv4 to IPv6 by enabling IPv6 connectivity between systems that are connected only via IPv4 infrastructure.

---

### 🔧 How 6to4 Works

* It **encapsulates IPv6 packets inside IPv4 packets** using **protocol 41** (not to be confused with TCP/UDP ports).
* The **IPv6 address is derived from the IPv4 address** of the 6to4 gateway.

### 📘 IPv6 Address Format in 6to4

The IPv6 address begins with the **6to4 prefix `2002::/16`**, followed by the hexadecimal representation of the public IPv4 address.

For example:

* IPv4 address: `192.0.2.4`
* Convert to hex: `C000:0204`
* 6to4 IPv6 prefix: `2002:C000:0204::/48`

This allows devices to construct a routable IPv6 address from an IPv4 address.

---

### 🔁 Traffic Flow

1. An IPv6 packet is created on the source device.
2. It’s encapsulated in an IPv4 packet (protocol 41) by the 6to4 gateway/router.
3. The packet travels over the IPv4 network to the destination 6to4 gateway.
4. The receiving gateway decapsulates the packet and delivers the IPv6 payload.

---

### 🧱 Requirements

* A public IPv4 address
* A router or host that supports 6to4
* Typically does **not** work behind NAT

---

### ⚠️ Drawbacks

* **Unreliable:** Routing may break if 6to4 relays are misconfigured or unreachable.
* **NAT Issues:** Doesn’t work well behind NAT (since it requires a public IPv4 address).
* **Deprecated:** As of [RFC 7526](https://datatracker.ietf.org/doc/html/rfc7526), **6to4 is deprecated** due to operational problems and the availability of better alternatives.

---

### 🧩 Alternatives

* **Teredo:** Tunnels IPv6 through NAT using UDP.
* **ISATAP:** For intra-site automatic tunneling.
* **Dual Stack:** Preferred long-term solution (native IPv6 and IPv4 together).
* **DS-Lite, NAT64/DNS64, 464XLAT:** Other transition mechanisms.

---

# Intra-Site Automatic Tunnel Addressing Protocol

Sure! Here’s a brief overview of **Intra-Site Automatic Tunnel Addressing Protocol (ISATAP)**:

## What is ISATAP?

**ISATAP** stands for **Intra-Site Automatic Tunnel Addressing Protocol**. It’s a tunneling mechanism that allows IPv6 packets to ==be transmitted over an IPv4 network within a site or organization.==

## Purpose

ISATAP enables the transition from IPv4 to IPv6 by encapsulating IPv6 packets inside IPv4 headers, allowing IPv6 connectivity over an existing IPv4 infrastructure without requiring direct native IPv6 support in the network.

## Key Features

* **Automatic tunneling**: It automatically creates IPv6-over-IPv4 tunnels.
* **Intra-site usage**: Mainly designed for use inside an organization or site.
* **No need for dual-stack everywhere**: Hosts can communicate over IPv6 even if the underlying network is IPv4-only.
* **Encapsulation**: IPv6 packets are encapsulated in IPv4 packets with protocol number 41.

## How it works

* Hosts are assigned an IPv6 address with an embedded IPv4 address.
* IPv6 packets are encapsulated inside IPv4 packets for transport.
* The IPv4 network acts as a virtual IPv6 link.

---

# Link-Local Address in IPv6

Great question! Here’s a simple explanation of **IPv6 link-local addresses**:

## What is a Link-Local Address in IPv6?

A **link-local address** is an IPv6 address that is used for communication **only within a single local network segment** (or "link"). It **cannot** be routed beyond that local link.

### Key Points:

* **Scope:** Only valid and reachable within the local network segment (like your home Wi-Fi or office LAN).
* **Prefix:** Always starts with `FE80::/10` (meaning the first 10 bits are fixed as `1111 1110 10`).
* **Automatically assigned:** Devices automatically generate their own link-local addresses.
* **Uses:** Essential for basic network functions like:

  * Neighbor discovery (finding other devices on the local link)
  * Auto-configuration
  * Routing protocols communication between routers on the same link

### Format example:

```
FE80::1A2B:3C4D:5E6F:7G8H
```

where the rest of the address is usually derived from the device’s MAC address or generated randomly.

### When do you use it?

* When devices communicate directly on the same local network without the need for a global or unique local address.
* For things like router discovery, automatic address configuration, or troubleshooting local connectivity.

---

# Firewall File and Printer Sharing Policy 

### How does “File and Printer Sharing” relate to IPv6 and ping?

* **Windows Firewall** (and other OS firewalls) uses predefined rules or profiles to control network traffic.

* **File and Printer Sharing** is one such rule set, which allows certain network protocols and ports, including:

  * **ICMPv6 (ping) packets**
  * Network Discovery protocols (like LLTD, LLMNR)
  * SMB file sharing ports (like TCP 445)

* In **IPv6 networks**, **ICMPv6** is essential for:

  * Neighbor discovery (finding other hosts)
  * Router discovery
  * Ping (echo request/reply)

* When the firewall blocks **File and Printer Sharing**, it often implicitly blocks **ICMPv6 traffic**, especially echo requests/replies on the local link.


### Practical effect:

* You can ping IPv4 addresses between hosts because IPv4 ICMP traffic is allowed.
* IPv6 pings fail because ICMPv6 is blocked by firewall rules related to File and Printer Sharing.
* Enabling File and Printer Sharing or explicitly allowing ICMPv6 in the firewall fixes this.


### What to do?

* **Enable File and Printer Sharing** for the network profile you are on (Private/Home or Domain).
* Or, if you prefer more control, **create a custom firewall rule to allow ICMPv6 Echo Requests**:

  * In Windows Firewall:

    1. Open *Windows Defender Firewall with Advanced Security*
    2. Create a new **Inbound Rule**
    3. Choose **Custom** > Protocol type **ICMPv6**
    4. Allow **Echo Request** messages
    5. Apply it to the desired profiles (Private, Domain)
* After enabling this, IPv6 ping to link-local addresses should work.

---

# What is 6to4

**6to4** is an **IPv6 transition mechanism** that allows IPv6 packets to be transmitted over an IPv4 network. It was designed to help with the gradual shift from IPv4 to IPv6 by enabling IPv6 connectivity between systems that are connected only via IPv4 infrastructure.


### 🔧 How 6to4 Works

* It **encapsulates IPv6 packets inside IPv4 packets** using **protocol 41** (not to be confused with TCP/UDP ports).
* The **IPv6 address is derived from the IPv4 address** of the 6to4 gateway.

### 📘 IPv6 Address Format in 6to4

The IPv6 address begins with the **6to4 prefix `2002::/16`**, followed by the hexadecimal representation of the public IPv4 address.

For example:

* IPv4 address: `192.0.2.4`
* Convert to hex: `C000:0204`
* 6to4 IPv6 prefix: `2002:C000:0204::/48`

This allows devices to construct a routable IPv6 address from an IPv4 address.

### 🧱 Requirements

* A public IPv4 address
* A router or host that supports 6to4
* Typically does **not** work behind NAT

---

# cmd-let

A **cmdlet** (pronounced “command-let”) is a lightweight, specialized command used in **Windows PowerShell**.

---

### What is a Cmdlet?

* It's a **single-function command** designed to perform a specific task in PowerShell.
* ==Unlike traditional commands or executables, cmdlets are **built-in .NET classes**.==
* They follow a **verb-noun** naming convention, such as:

  * `Get-Process` — retrieves processes running on your computer.
  * `Set-Item` — modifies an item’s properties.
  * `New-User` — creates a new user account.


### Key Features of Cmdlets

* They **work with objects** instead of just text (unlike traditional shells).
* Support **pipeline** operations, meaning output of one cmdlet can be passed as input to another.
* Designed to be **easy to script** and automate complex tasks.


### Examples

```powershell
Get-Help Get-Process     # Shows help about the Get-Process cmdlet
Get-Service              # Lists services on the system
Stop-Process -Name notepad  # Stops the Notepad process
```

---

# Protproxy

`portproxy` is a feature in **Windows** that allows you to **forward network traffic** from one IP address and port to another. It is typically used for **port forwarding** or **proxying TCP connections**, which can be useful in various network configurations such as:

* Redirecting traffic to a different server.
* Bypassing network restrictions.
* Acting as a simple form of a reverse proxy.

### 🔧 How it Works

The `portproxy` functionality is controlled through the **`netsh` (Network Shell)** command-line tool in Windows. You can configure it to listen on a specific IP and port and then forward the incoming traffic to another IP and port.

### ✅ Example Use Case

Let's say you want to forward traffic from your local machine on port `8080` to a remote server on port `80`.

```cmd
netsh interface portproxy add v4tov4 listenport=8080 listenaddress=127.0.0.1 connectport=80 connectaddress=192.168.1.100
```

This means:

* Listen on **localhost:8080**
* Forward all traffic to **192.168.1.100:80**


### 🔄 Managing Portproxy Rules

* **View current rules:**

  ```cmd
  netsh interface portproxy show all
  ```

* **Delete a rule:**

  ```cmd
  netsh interface portproxy delete v4tov4 listenport=8080 listenaddress=127.0.0.1
  ```


### ⚠️ Limitations

* `portproxy` only works with **TCP**, not UDP.
* It does **not perform NAT** — it simply redirects the TCP stream.
* Sometimes requires **IPv6 components** to be enabled even when using IPv4.
* Can require **elevated privileges (admin rights)** to configure.

---

# Get-NetIPAddress to find InterfaceIndex