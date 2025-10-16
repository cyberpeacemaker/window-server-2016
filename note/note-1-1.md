# IP Classes

### **Class A**

* **IP Range**: 1.0.0.0 to 127.255.255.255
* **Default Subnet Mask**: 255.0.0.0 (or /8)
* **Number of Hosts per Network**: 16,777,214
* **Purpose**: Class A is typically used by large organizations or ISPs. The first octet (8 bits) is used for the network part, and the remaining 24 bits are used for hosts.

### **Class B**

* **IP Range**: 128.0.0.0 to 191.255.255.255
* **Default Subnet Mask**: 255.255.0.0 (or /16)
* **Number of Hosts per Network**: 65,534
* **Purpose**: Class B is used by medium-sized networks. The first 16 bits are used for the network part, and the remaining 16 bits are used for hosts.

### **Class C**

* **IP Range**: 192.0.0.0 to 223.255.255.255
* **Default Subnet Mask**: 255.255.255.0 (or /24)
* **Number of Hosts per Network**: 254
* **Purpose**: Class C is used for smaller networks, such as small businesses or home networks. The first 24 bits are used for the network part, and the remaining 8 bits are used for hosts.

### **Class D (Multicast)**

* **IP Range**: 224.0.0.0 to 239.255.255.255
* **Purpose**: Class D addresses are reserved for multicast communication, which is used to send data to multiple devices at once (e.g., streaming video, IPTV).

### **Class E (Reserved for Future Use)**

* **IP Range**: 240.0.0.0 to 255.255.255.255
* **Purpose**: Class E addresses are reserved for experimental purposes and are not used for regular network communication.

## **Special Addresses**

* **127.0.0.1**: Loopback address (localhost)
* **169.254.x.x**: Link-local address (self-assigned IP when DHCP fails)
* **0.0.0.0**: Used to refer to the default network or a non-specific address.

---

# Private IP addresses 

## **Private IP Address Ranges (IPv4)**

1. **Class A:**

   * **Range:** `10.0.0.0` to `10.255.255.255`
   * **Subnet Mask:** `255.0.0.0` (or `/8`)
   * **Total IPs:** 16,777,216 addresses

2. **Class B:**

   * **Range:** `172.16.0.0` to `172.31.255.255`
   * **Subnet Mask:** `255.240.0.0` (or `/12`)
   * **Total IPs:** 1,048,576 addresses

3. **Class C:**

   * **Range:** `192.168.0.0` to `192.168.255.255`
   * **Subnet Mask:** `255.255.0.0` (or `/16`)
   * **Total IPs:** 65,536 addresses

### **Usage**

* **Private IP addresses** are mainly used in home networks, corporate networks, and internal infrastructure (like printers, servers, routers, etc.).
* Devices with private IPs communicate within the local network.
* **NAT (Network Address Translation)** is used to allow devices with private IPs to access the public internet by mapping private IPs to a single or a range of public IP addresses.

### **Why Private IPs?**

* **Conservation of IP addresses**: IPv4 addresses are limited, and using private IPs helps preserve the number of public IPs needed.
* **Security**: Devices with private IPs are not directly accessible from the internet, adding a layer of protection.

### **Example of Private IP Usage**

If you set up a home network, your router is usually assigned a private IP (e.g., `192.168.1.1`), and the devices connected to it (like your phone, laptop, or smart TV) are assigned private IPs in the range `192.168.1.x`. ==If any of these devices want to access the internet, the router uses NAT to forward their traffic with its own public IP.==

---

# APIPA

**APIPA** stands for **Automatic Private Internet Protocol Addressing**. It is a feature in Windows operating systems (and some other devices) that automatically assigns an IP address to a device ==when it is unable to obtain one from a DHCP (Dynamic Host Configuration Protocol) server.==

### Key Points about APIPA:

* ==**Range**: APIPA assigns IP addresses in the range **`169.254.0.1` to `169.254.255.254`**.==
* ==**Subnet Mask**: The subnet mask is typically **`255.255.0.0`** (or **/16**).==
* **Purpose**: It allows devices to communicate within the same local network (subnet) even when there’s no DHCP server available. This is especially useful for small or isolated networks.

### Limitations of APIPA:

* **Local communication only**: Devices with APIPA addresses can only communicate with other devices that have APIPA addresses in the same subnet. They can't communicate outside the local network or access the internet.
* **No internet access**: Since the device does not get a valid public IP address, it won't be able to reach websites or any resources outside the local network.

### Troubleshooting:

* ==If you see an APIPA address== and you expect to be getting a DHCP address (say, from your router), this often indicates an issue with your router’s DHCP service. You may need to:

  * Restart your router.
  * Check the network cables or Wi-Fi connection.
  * Verify that the router’s DHCP functionality is enabled.

---

# Increment between IP addresses
TODO:

**increment between IP addresses**, which typically refers to the ==**difference** in IP addresses when subnetting or calculating ranges of IPs.==


### 1. **Increment in an IP Range/Subnet**

If you have a range of IP addresses or a subnet, you can increment the IP addresses by a certain value (typically 1 for standard use). Here's how you might approach it:

#### Example:

Let’s say your subnet is `192.168.1.0/24`.

* **Subnet**: `192.168.1.0/24`
* The usable IP addresses range from **`192.168.1.1`** to **`192.168.1.254`** (the first and last addresses are reserved for network identification and broadcast, respectively).

If you were to **increment between addresses**, you'd simply go from one address to the next:

* **First address**: `192.168.1.1`
* **Next address**: `192.168.1.2`
* **Next address**: `192.168.1.3`
* …and so on.

For most IP ranges, the increment between addresses is **1**. In a `/24` network, the increment between any two consecutive usable addresses would be 1.

### 2. **Increment for Subnetting**

If you're working with subnetting and dividing a larger network into smaller subnets, the **increment** is often based on the **subnet mask**.

#### Example with a `/30` Subnet:

Let’s say you have a larger network and you need to create subnets with a **/30** subnet mask (4 IP addresses per subnet, where 2 are usable).

* If you start with `192.168.1.0/30`, the addresses would increment as:

  1. **Network Address**: `192.168.1.0`
  2. **First Usable IP**: `192.168.1.1`
  3. **Second Usable IP**: `192.168.1.2`
  4. **Broadcast Address**: `192.168.1.3`

Next subnet would start with `192.168.1.4/30`, and the pattern continues.


### **Calculating the Increment**

The **increment** between IP addresses depends on the **subnet size** (i.e., the subnet mask). For example, in a `/24` network, the IPs will increment by 1 (e.g., `192.168.1.1`, `192.168.1.2`, etc.).

---

# Classful and Classless IP

## 🔹 Classful IP Addressing (Old/Legacy)

Classful addressing is the **original method** of dividing IP address space. It divides the IPv4 address space into **fixed classes** based on the first few bits of the IP address.

### 🧱 IP Address Classes:

| Class | Starting Bits | Range (1st Octet) | Default Subnet Mask | Number of Hosts |
| ----- | ------------- | ----------------- | ------------------- | --------------- |
| A     | `0`           | 1 – 126           | 255.0.0.0 (/8)      | ~16 million     |
| B     | `10`          | 128 – 191         | 255.255.0.0 (/16)   | ~65,000         |
| C     | `110`         | 192 – 223         | 255.255.255.0 (/24) | 254             |
| D     | `1110`        | 224 – 239         | — (Multicast)       | —               |
| E     | `1111`        | 240 – 255         | — (Experimental)    | —               |

==* **Note:** `127.x.x.x` is reserved for loopback (localhost).==
* No subnetting used initially — fixed networks per class.

### ❗ Problems with Classful Addressing:

* **Wasteful**: A Class A network had 16 million IPs even if you only needed 10.
* **Inflexible**: Couldn't divide networks efficiently.

---

## 🔹 Classless IP Addressing (Modern — CIDR)

CIDR = **Classless Inter-Domain Routing**, introduced in 1993 (RFC 1519), to overcome the inefficiency of classful addressing.

### ✅ Features of Classless Addressing:

* **No classes** — any IP can have any subnet mask.
* Uses **CIDR notation**: `192.168.1.0/24`, `10.1.0.0/22`, etc.
* Subnets are based on **prefix length**, not fixed class.
 | 65,536   | Supernet (multiple /24s) |

## 🕰️ **Originally — Yes, IPs Were Distributed Classfully**

In the **early days of the Internet (1980s to early 1990s)**:

* IP address blocks were handed out by the **IANA (Internet Assigned Numbers Authority)** based on **classful addressing**.
* Organizations were given **Class A, B, or C** networks depending on size:

  * A university might get a **Class B** (`/16`)
  * A large company might get a **Class A** (`/8`)
  * A small business might get a few **Class C** networks

### 🔺 Problems:

* **Massive waste of IP space**. Example: MIT was given an entire **Class A** (`18.0.0.0/8`) — that’s **16 million IPs** — even though they only needed a fraction.
* The Internet was growing rapidly, and **IPv4 exhaustion** was becoming a serious concern.

## 🔄 Then Came CIDR and Classless Allocation (Post-1993)

To fix this, **CIDR (Classless Inter-Domain Routing)** was introduced in **1993 (RFC 1519)**.

After that:

### ✅ **IANA and RIRs began distributing IP blocks classlessly**

* No more "give a whole Class A/B/C"
* Instead, allocations like:

  * `/19`, `/20`, `/22`, `/24` depending on actual **need**
* This helped:

  * **Conserve IP space**
  * **Allow subnetting and route aggregation**
  * **Simplify routing tables**

### 🏢 Modern Flow of IP Allocation:

1. **IANA** (global IP pool)
2. → **RIRs** (Regional Internet Registries, like ARIN, RIPE, APNIC)
3. → **LIRs / ISPs / Large Orgs**
4. → **End users / customers**

> 📌 These allocations are **CIDR-based**, not class-based anymore.

## ✅ So in Summary:

| Era       | IP Allocation Method | Distribution Type                |
| --------- | -------------------- | -------------------------------- |
| Pre-1993  | Classful             | A, B, C blocks                   |
| Post-1993 | Classless (CIDR)     | /x blocks based on need          |
| Today     | Classless (only)     | /x blocks (e.g., /22, /24, etc.) |


## 📚 Extra Notes:

* While **IP address classes** are still sometimes taught or referenced (e.g., for private IP ranges like `10.0.0.0/8`), they are **not used** in modern IP distribution or routing.
* Modern routing protocols (like BGP, OSPFv2) rely on **CIDR**, not classes.

---

Great — let’s walk through the **relationship between IANA, ICANN, and RIRs**, and how they manage **IP address allocation** in today’s Internet.

---

# ICANN, IANA, RIR

## 🌐 Overview: Who Manages the Internet's Numbering System?

Here’s how it works from the top down:

### 1. **ICANN** (Internet Corporation for Assigned Names and Numbers)

* **What it is:** A **non-profit organization** responsible for global coordination of the **DNS**, **IP addressing**, and **protocol identifiers**.
* **Established:** 1998, under U.S. Department of Commerce — now operates globally.
* **Role:** Oversees policies for how IP addresses and domain names are distributed and used.
* **Supervises:** IANA

### 2. **IANA** (Internet Assigned Numbers Authority)

* **What it is:** A **function operated by ICANN** that handles:

  * Allocation of **IP address blocks** (IPv4 & IPv6)
  * Management of **DNS root zone**
  * Assignment of **protocol numbers and ports**
* **Role in IP addresses:** IANA holds the **global IP pool** and allocates large blocks to **RIRs**.

> 🧠 Think of IANA as the **global distributor** of IP numbers.

---

### 3. **RIRs** (Regional Internet Registries)

These are the **regional managers** that receive IP blocks from IANA and distribute them within their territories.

| RIR      | Region Served                     | HQ Location |
| -------- | --------------------------------- | ----------- |
| ARIN     | North America                     | USA         |
| RIPE NCC | Europe, Middle East, Central Asia | Netherlands |
| APNIC    | Asia-Pacific                      | Australia   |
| LACNIC   | Latin America & Caribbean         | Uruguay     |
| AFRINIC  | Africa                            | Mauritius   |

* RIRs allocate IPs to:

  * **LIRs (Local Internet Registries)** — usually ISPs or large organizations
  * **End users**, for special needs

> 🧠 RIRs manage **regional policies** for IP distribution, based on community input.

---

### 🗂️ IP Address Allocation Flow:

```
ICANN
  ↓
IANA (global IP pool)
  ↓
RIRs (regional blocks, e.g., /8s, /12s)
  ↓
ISPs / LIRs / Enterprises (smaller CIDR blocks like /24, /22)
  ↓
End Users / Customers (via DHCP, static assignment, etc.)
```


## 📌 Key Points to Remember:

| Term      | Role in IP Distribution                      |
| --------- | -------------------------------------------- |
| **ICANN** | Oversees global coordination of IP and DNS   |
| **IANA**  | Allocates IPs from global pool to RIRs       |
| **RIRs**  | Manage regional IP distribution to ISPs/orgs |
-------------------------------------------------------------


## 🔍 Example:

Let’s say **IANA** allocates:

* `200.0.0.0/7` to **LACNIC** (RIR for Latin America)

Then **LACNIC** may allocate:

* `200.1.0.0/16` to a large ISP in Brazil

That ISP can assign:

* `200.1.5.0/24` to a business customer

That business then uses DHCP or static IPs to assign:

* `200.1.5.10` to a specific server or user device.

---

# 🔹 What is WINS?

**WINS (Windows Internet Name Service)** is a **name resolution service** developed by Microsoft. It maps **NetBIOS names** (used by older Windows systems) to **IP addresses** in a network.

### 🔹 Purpose of WINS:

Before DNS became standard, WINS allowed computers to **find each other by name** (like `MYPC`) instead of needing an IP address.

### 🔹 Key Features:

* Resolves **NetBIOS names to IP addresses**
* Useful in **older Windows networks**
* Works dynamically — clients register and update names automatically
* Uses a **WINS server** for managing name records

### 🔹 Modern Usage:

WINS is mostly **obsolete** now, replaced by **DNS**, but might still exist in legacy networks.

---

# 🔹 What is **Multicasting**?

**Multicasting** is a method of **sending a single stream of data to multiple recipients** at once, without sending multiple separate copies.

### 🔸 In Simple Terms:

It’s like sending **one message** to a **group**, instead of sending it individually to each person.


### 🔹 Key Points:

* Uses **special IP address ranges** (224.0.0.0 to 239.255.255.255 in IPv4)
* Efficient for **live video streaming, online gaming, conferencing**, etc.
* Supported by protocols like **IGMP** (IPv4) and **MLD** (IPv6)


### 🔹 Types of Network Communication:

| Type          | Description                               |
| ------------- | ----------------------------------------- |
| **Unicast**   | One-to-one                                |
| **Broadcast** | One-to-all (entire network)               |
| **Multicast** | One-to-many (specific group of receivers) |
| **Anycast**   | One-to-one-of-many (closest in a group)   |

### 🔹 Example Use Case:

A live webinar being streamed to 100 users — instead of sending 100 individual video streams (**unicast**), the server sends **one multicast** stream that all 100 users receive.

---

### 🔹 What is a **RIP Routing Table**?

In **RIP (Routing Information Protocol)**, the **routing table** stores information about how to reach different networks. Each entry shows the **destination network**, the **next hop**, and the **metric** (hop count).

RIP uses **hop count as its metric**, with a maximum of **15 hops**. Anything beyond 15 is considered unreachable.


### 🔸 Sample RIP Routing Table:

| Destination Network | Next Hop IP      | Metric (Hops) | Interface |
| ------------------- | ---------------- | ------------- | --------- |
| 192.168.1.0/24      | 0.0.0.0 (direct) | 1             | eth0      |
| 192.168.2.0/24      | 192.168.1.2      | 2             | eth0      |
| 10.0.0.0/8          | 192.168.1.3      | 3             | eth0      |


### 🔹 How RIP Works:

* RIP routers **broadcast** their entire routing table every **30 seconds** to neighbors.
* Routers use received info to **update their own routing tables**.
* If a route is not updated for **180 seconds**, it's marked as **invalid**.

### 🔹 RIP Version Differences:

| Feature         | RIP v1        | RIP v2        |
| --------------- | ------------- | ------------- |
| Classless?      | ❌ No          | ✅ Yes         |
| Authentication? | ❌ No          | ✅ Yes         |
| Multicast?      | ❌ (Broadcast) | ✅ (224.0.0.9) |

---

### 🔹 What is a **Screened Subnet**?

A **screened subnet**, also known as a **DMZ (Demilitarized Zone)**, is a **network security architecture** used to isolate **public-facing services** from an internal network.

### 🔹 How it Works:

* Uses **two firewalls** (or a firewall with 3 interfaces):

  1. **One firewall** between the **internet** and the **DMZ**
  2. **Another firewall** between the **DMZ** and the **internal network**
* Traffic is **filtered** in and out of the DMZ, reducing attack risk.


### 🔸 Typical Layout:

```
[Internet]
    |
 [Firewall 1]
    |
 [DMZ / Screened Subnet]
    |
 [Firewall 2]
    |
 [Internal Network]
```

---

# built-in constant

### 🔹 `$false` is **not** a regular variable — it's a **built-in constant** in PowerShell.

#### ✅ Think of it like this:

* `$false` and `$true` are **predefined automatic variables** (technically **constants**) of type `[bool]`.
* They represent the **boolean values**:

  * `$true` = **True**
  * `$false` = **False**

### 🔸 Why the `$` in `$false`?

Because **all variables/constants in PowerShell start with `$`**, even built-ins like:

| Symbol   | Meaning                               |
| -------- | ------------------------------------- |
| `$true`  | Boolean true constant                 |
| `$false` | Boolean false constant                |
| `$null`  | Null value                            |
| `$args`  | Arguments passed to a script/function |
| `$env:`  | Environment variables                 |

So even though `$false` isn't a user-defined variable, **PowerShell still requires the `$`** to access its value.


### 🔹 Examples:

```powershell
$myVar = $false    # Assigns the built-in $false to your variable
if (-not $myVar) { "It's false" }  # Will execute
```


### ⚠️ Without `$`, `false` means nothing:

```powershell
PS> false
false : The term 'false' is not recognized...
```

So PowerShell sees `false` as an undefined command or variable — because it **must** have `$false`.

### ✅ Summary:

| Expression | Meaning                  |
| ---------- | ------------------------ |
| `$false`   | Built-in Boolean `False` |
| `false`    | Not recognized (error)   |
| `$myVar`   | A user-defined variable  |

---

# 🔹 What is **NetBIOS**?

**NetBIOS** stands for **Network Basic Input/Output System**.
It’s an **old networking protocol** developed in the 1980s to allow computers on a local network to **communicate** using **names** instead of IP addresses.


## 🔸 Key Points:

| Feature                 | Description                                                                    |
| ----------------------- | ------------------------------------------------------------------------------ |
| 📛 **Name service**     | Resolves NetBIOS names (like `COMPUTER1`) to IP addresses (like `192.168.1.5`) |
| 📨 **Session service**  | Manages connections between computers (like file and printer sharing)          |
| 💬 **Datagram service** | Sends small messages without a connection (like a ping)                        |

## 🔸 Example Usage:

* Windows computers using **file sharing** (like `\\MY-PC\SharedFolder`)
* Older Windows networks **before DNS became common**
* **WINS** (Windows Internet Name Service) was used to manage NetBIOS names centrally

## 🔸 NetBIOS vs. NetBEUI vs. DNS:

| Protocol    | Description                                                 |
| ----------- | ----------------------------------------------------------- |
| **NetBIOS** | API for name-based communication (not a protocol by itself) |
| **NetBEUI** | A transport protocol using NetBIOS (obsolete)               |
| **DNS**     | Modern, scalable name resolution protocol                   |


## 🔹 Is NetBIOS still used today?

* ✅ Still present in many Windows environments (for legacy support)
* ==⚠️ Often **disabled** in secure or modern networks==
* 🔄 Replaced mostly by **DNS** and **Active Directory**

---

### 🔐 Security Note:

NetBIOS can be a **security risk** if exposed to the internet. It’s best to:

* Disable it on public interfaces
* Block ports **137–139** (used by NetBIOS over TCP/IP)

### 🔹 What is **"NetBIOS Domain Name over TCP/IP"?**

This phrase refers to how **NetBIOS names** (like `MYPC` or `CORPDOMAIN`) are used and resolved **over TCP/IP networks**, particularly in **Windows networking environments**.

When you see “NetBIOS domain name over TCP/IP,” you're usually looking at a **legacy name resolution method** in Windows networks that predates full DNS usage.

---

### 🔸 Breaking It Down:

| Term            | Meaning                                                                                                       |
| --------------- | ------------------------------------------------------------------------------------------------------------- |
| **NetBIOS**     | An older API/protocol for name-based communication                                                            |
| **Domain Name** | In this context, it refers to a **NetBIOS domain name**, like `CORPDOMAIN` (not a DNS name like `corp.local`) |
| **Over TCP/IP** | Means NetBIOS is running on modern IP networks using ports 137–139                                            |

### 🔹 Example:

You join a Windows computer to a domain:

* **NetBIOS domain name**: `CORP`
* **DNS domain name**: `corp.local`
* Both may refer to the same domain, but used differently:

  * `CORP` is used in legacy tools (NetBIOS)
  * `corp.local` is used by modern systems (DNS)

### 🔸 NetBIOS over TCP/IP = **NetBT**

* It’s an actual protocol: **NetBIOS over TCP/IP (NetBT)**
* Enables NetBIOS name resolution and communication on IP networks
* Uses these ports:

  * UDP 137 (name service)
  * UDP 138 (datagram service)
  * TCP 139 (session service)

### 🔐 Security & Modern Practice

* **Modern Windows domains** use **DNS** for name resolution.
* **NetBIOS domain names** still exist for **backward compatibility**.
* **Best practice**: disable **NetBIOS over TCP/IP** unless needed.

You can disable it per network adapter:

* Go to **Network Properties** → IPv4 → Advanced → WINS → Disable NetBIOS over TCP/IP

### ✅ Summary

| Feature                 | Description                                                      |
| ----------------------- | ---------------------------------------------------------------- |
| **NetBIOS Domain Name** | Legacy domain name like `CORP`                                   |
| **DNS Domain Name**     | Modern domain name like `corp.local`                             |
| **Used for**            | File sharing, Windows logins (pre-Active Directory), legacy apps |
| **Modern replacement**  | DNS, LDAP, Kerberos, Active Directory                            |

---

# **DNS suffixes**

* **Primary DNS suffix**
* **Connection-specific DNS suffix**
* **Parent suffix search list**

These all affect how **hostnames are resolved** (e.g., turning `server1` into `server1.company.com`).



## 🔹 1. **Primary DNS Suffix**

* This is the **main domain name** Windows assigns to your computer.
* It's used in:

  * Full computer name (e.g., `PC1.corp.local`)
  * DNS registrations
  * AD domain joins

🛠️ Set via:

* **System Properties** → Computer Name → Change → More
* Or via **Group Policy** / domain membership

🔹 Example:
If `PC1` is joined to domain `corp.local`, the **primary DNS suffix** is:

```
corp.local
```

---

## 🔹 2. **Connection-specific DNS Suffix**

* This is a DNS suffix applied **per network adapter**.
* Useful when your adapter connects to a specific network domain, different from your system’s domain.

🛠️ Set via:

* Network adapter properties → IPv4 → Advanced → DNS tab
* DHCP (via `Option 15`)

🔹 Example:
If you're connected to a VPN and get `vpn.branch.local` as the suffix, your DNS can resolve:

```
printer01 → printer01.vpn.branch.local
```

---

## 🔹 3. **DNS Suffix Search List / Parent Suffix Search List**

* A list of DNS suffixes the system **tries automatically** when resolving unqualified names (like just `webserver`).
* Applies to all name lookups.

🛠️ Set via:

* Group Policy
* Manually via:

  ```powershell
  Set-DnsClientGlobalSetting -SuffixSearchList @("corp.local", "branch.local")
  ```

🔹 Example:
Search order:

```text
ping server1
→ tries: 
   server1.corp.local
   server1.branch.local
```

---

## ✅ Summary Table

| Term                           | Scope               | Example Value      | Set via               |
| ------------------------------ | ------------------- | ------------------ | --------------------- |
| **Primary DNS suffix**         | System-wide         | `corp.local`       | System Properties, AD |
| **Connection-specific suffix** | Per network adapter | `vpn.branch.local` | NIC settings, DHCP    |
| **Suffix search list**         | Lookup process      | `["corp.local"]`   | GPO, PowerShell       |


### 🔍 Want to view current settings?

Run this in PowerShell:

```powershell
Get-DnsClient | Select-Object InterfaceAlias, ConnectionSpecificSuffix

(Get-WmiObject Win32_ComputerSystem).Domain
```


