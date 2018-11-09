# Infrastructure as code by Kief Morris - Cliff Notes

## Chapter 1: Challenges and principles
“Shadow IT” is when people bypass formal IT governance to bring in their own devices, buy and install unapproved software, or adopt cloud-hosted services. This is typically a sign that internal IT is not able to keep up with the needs of the organization it serves.

IT infrastructure supports and enables change, rather than being an obstacle.

A snowflake server is different from any other server on your network. It’s special in ways that can’t be replicated.

Automation fear spiral is where you are afraid of automating because you fear it will break something, and because you have not automated, more stuff breaks. Infrastructure teams need to break this spiral to use automation successfully.


In an ideal world, you would never need to touch an automated infrastructure once you’ve built it, other than to support something new or fix things that break. Sadly, the forces of entropy mean that even without a new requirement, infrastructure decays over time. The folks at Heroku call this erosion. Erosion is the idea that problems will creep into a running system over time.

It should be possible to effortlessly and reliably rebuild any element of an infrastructure. Effortlessly means that there is no need to make any significant decisions about how to rebuild the thing. Decisions about which software and versions to install on a server, how to choose a hostname, and so on should be captured in the scripts and tooling that provision it.

Effective infrastructure teams have a strong scripting culture.

If a task can be scripted, script it. If a task is hard to script, drill down and see if there’s a technique or tool that can help, or whether the problem the task is addressing can be handled in a different way.

The cornerstone practice of infrastructure as code is the use of definition files. A definition specifies infrastructure elements and how they should be configured.

IT teams commonly struggle to keep their documentation relevant, useful, and accurate. Someone might write up a comprehensive document for a new process, but it’s rare for such documents to be kept up to date as changes and improvements are made to the way things are done. And documents still often leave gaps. Different people find their own shortcuts and improvements. Some people write their own personal scripts to make parts of the process easier.

Nicholas Taleb coined the term “antifragile” with his book of the same title, to describe systems that actually grow stronger when stressed. Taleb’s book is not IT- specific: his main focus is on financial systems—but his ideas are relevant to IT architecture.

Some signals that a team is doing well: 
* Every element of the infrastructure can be rebuilt quickly, with little effort. 
* All systems are kept patched, consistent, and up to date.
* Standard service requests, including provisioning standard servers and environ‐ ments, can be fulfilled within minutes, with no involvement from infrastructure team members. SLAs are unnecessary. 
* Maintenance windows are rarely, if ever, needed. Changes take place during working hours, including software deployments and other high-risk activities. * The team tracks mean time to recover (MTTR) and focuses on ways to improve this. Although mean time between failure (MTBF) may also be tracked, the team does not rely on avoiding failures.8 
* Team members feel their work is adding measurable value to the organization.

## Chapter 2: Dynamic Infrastructure Platforms

Dynamic infrastructure platform is a system that provides computing resources,
i.e. compute, storage, networking in a way that can be programmatically allocated and managed.

Infrastructure as code is about treating infrastructure as a software system, which means the dynamic infrastructure platform needs to have certain characteristics. The platform needs to be: 
* Programmable 
* On-demand 
* Self-service

Some managed hosting providers, and internal IT departments, offer services they describe as cloud, but which require raising requests for staff to actually carry out the activities. For an organization to use infrastructure as code, its hosting platform must be able to fulfill provisioning requests within minutes, if not seconds.

Self-service adds a bit more onto the on-demand requirement for the infrastructure platform. Not only should infrastructure users be able to have resources quickly, they must have the ability to tailor and customize those resources to their requirements.

This is in contrast with the more traditional approach, where a central team (or group of teams) designs solutions for teams that need infrastructure. Even a common request such as a new web server may involve a detailed request form, design and specification documents, and implementation plan. This is like buying a box of LEGO bricks, but having the shop staff decide how to assemble them for you. It prevents the requesting team from taking ownership of the infrastructure they use and learning how to to shape it to their own needs and improve it over time.

Hand-cranked virtual infrastructure uses virtualization tools to manage hardware resources, but doesn’t provide them to users dynamically or with a self-service model. I’ve seen organizations do this with expensive virtualization software, and even cloud-capable software like VMware vCloud. They keep the old, centralized model, requiring users to file tickets to request a server.

Some tools that can be used to implement a dynamic infrastructure platform with bare-metal servers include Cobbler, FAI - Fully Automatic Installation, Foreman, and Crowbar. These tools can take advantage of the PXE specification Preboot Execution Environment to boot a basic OS image downloaded from the network, which then runs an installer to download and boot an OS installer image. The installer image will run a script, perhaps with something like Kickstart, to configure the OS, and then potentially run a configuration management tool like Chef or Puppet.

Martin Thompson has borrowed the term mechanical sympathy from Formula One driver Jackie Stewart and brought it to IT. A successful driver like Stewart has an innate understanding of how his car works, so he can get the most out of it and avoid failures. For an IT professional, the deeper and stronger your understanding of how the system works down the stack and into the hardware, the more proficient you’ll be at getting the most from it.

## Chapter 3: Infrastructure definition tools

Tasks that can be reliably carried out without any human involvement are building blocks for a truly automated infrastructure

These are some characteristics of scripts and tasks that help to support reliable unattended execution:

Be ruthless about finding manual tasks that can be automated.

Systems configured by clicking in a GUI inevitably become inconsistent. Applying configuration from a definition file ensures that every system is built the same way, every time.

Procedural languages are useful for tasks where it’s important to understand how something should be done. Declarative definitions are useful when it’s more important to understand what you want. The logic of how it is done becomes the responsibility of the tool that reads the definition and applies it.

But the infrastructure definition tool often needs to pass configuration information to a server configuration tool when creating a server. For example, it may specify the server’s role so the configuration tool installs the relevant software and configuration. It may pass network configuration details such as DNS server addresses.

A configuration registry is a directory of information about the elements of an infrastructure. It provides a means for scripts, tools, applications, and services to find the information they need in order to manage and integrate with infrastructure. This is particularly useful with dynamic infrastructure because this information changes continuously as elements are added and removed.

The CMDB approach to ensuring infrastructure is consistent and compliant is reactive. It emphasizes reporting which elements of the infrastructure have been incorrectly or inconsistently configured so that they can be corrected. This assumes infrastructure will be routinely misconfigured, which is common with manually driven processes.

## Chapter 4: Server configuration tools
One of the key trade-offs is that, as more elements are managed by packaging them into server templates, the templates need to be updated more often. This then requires more sophisticated processes and tooling to build and manage templates.

Although it is useful to be able to run ad hoc commands interactively across servers, this should only be done for exceptional situations. Manually running a remote command tool to make changes to servers isn’t reproducible, so isn’t a good practice for infrastructure as code.

The danger of using scripting languages with these tools is that over time they can grow into a complicated mess. Their scripting languages are designed for fairly small scripts and lack features to help manage larger codebases in a clean way, such as reusable, shareable modules.

“We want to prefer a small number of well-known tools.” Etsy team’s approach to diversity versus standardization of tools and technologies.

Configuration synchronization repeatedly applies configuration definitions to servers, for example, by running a Puppet or Chef agent on an hourly schedule.

Immutable infrastructure makes configuration changes by completely replacing servers.

## Chapter 5: General Infrastructure services

A snowflake service that has been handcrafted over time is fragile: difficult to manage and easy to break.

Monitoring information comes in two types: state and events. State is concerned with the current situation, whereas an event records actions or changes.

End-user service is what really matters, so checking that everything is working correctly from the user’s point of view is essential. Active checks can log into a service and carry out key transactions or user journeys. These prove that the end-to-end systems are working correctly and giving the correct results to users.

Indirect monitoring alerts when behavior strays outside the normal boundaries.

A noisy alerting system is useless.

An information radiator, or a communal dashboard, is a highly visible display of information put up in a team space so everyone can easily see key status information


## Chapter 6: Patterns for Provisioning servers

Provisioning is not only done for a new server. Sometimes an existing server is reprovisioned, changing its role from one to another. Or a large server may be used for multiple roles and occasionally have a new role added.

With immutable servers, configuration is usually baked into the server template. When the configuration is updated, a new tem‐ plate is packaged. New instances of existing servers are built from the new template and used to replace the older servers.

Destroying a server may be simple, but infrastructure services need to be updated to reflect its removal. Data may also need to be retained. It’s useful to make sure that information about a deleted server is retained after it is deleted. Retaining historical metrics and log data for deleted servers is essential for debugging problems and tracking trends.

Resize a server pool. Being able to easily add and remove servers from a pool, such as load-balanced web servers or database nodes, is a handy benefit of being able to build servers repeatably and consistently.

The key difference between configuration and data is whether automation tools will automatically manage what’s inside the file.

Data that you care about needs to be managed so that it survives what happens to a server.

Building servers or templates typically involves downloading soft‐ ware packages and updates. Downloading these from public repo‐ sitories can take quite a while, often becoming the longest part of the process, and use significant network bandwidth. Making these files available closer to where templates and servers are built can speed things up dramatically.

Different servers will need different things installed on them depending on what they will be used for, which is where the concept of roles comes in.

One pattern is to define fine-grained roles, and combine these to compose particular servers.

Another pattern is to have a role-inheritance hierarchy. The base role would have the software and configuration common to all servers, such as a monitoring agent, com‐ mon user accounts, and common configuration like DNS and NTP server settings. Other roles would add more things on top of this, possibly at several levels.

So manually building servers leads almost immediately to configuration drift and snowflake servers. Server creation is not traceable, versionable, or testable, and is cer‐ tainly not self-documenting.

A script is a simple way to capture the process for creating new servers so that it’s easily repeatable. Check the script into a VCS to make it transparent, auditable, reversible, and to open the door to making it testable.

Antipattern: Hot Cloned Server

Cloned servers also suffer because they have runtime data from the original server.

Antipattern: Snowflake Factory

Running a configuration tool when creating a server requires bootstrapping to be able to run the tool. There are two main strategies for this: push bootstrapping and pull bootstrapping.

Having a single set of login credentials with root privileges preinstalled on every new server may create a security vulnerability. A safer approach is generating a one-off authentication secret when launching a new server.

Practice: Smoke Test Every New Server Instance

Smoke tests could be integrated with monitoring systems. Most of the checks that would go into a smoke test would work great as routine monitoring checks, so the smoke test could just verify that the new server appears in the monitoring system, and that all of its checks are green.

## Chapter 7: Patterns for managing server templates

Using stock images offloads the hassle and complexity of managing your own tem‐ plates. This can be especially helpful in the early days of setting up and running a new infrastructure.

One end of the spectrum is minimizing what’s on the template and doing most of the provisioning work when a new server is created.

The main drawback of doing most of the provisioning work every time a new server is created is that it takes longer to create a new server. Repeating the same activities for every new server can be wasteful.

For infrastructures where automatically creating new servers is a key part of disaster recovery, automatic scaling, and/or deployment, a heavyweight server creation pro‐ cess means these things take more time.

Doing all of the significant provisioning in the template, and disal‐ lowing changes to anything other than runtime data after a server is created, is the key idea of immutable servers.

“Cycle time” is a term used in Lean processes for measuring the end-to-end time for a particular activity. It is measured for a single work item and starts when the need is identified, and ends when the need has been fulfilled.

An alternative to booting the origin image is to mount the origin disk image in another server and apply changes to its filesystem. This tends to be much faster, but the customization process may be more complicated.

Antipattern: Hot Cloned Server Template

An OS installation image, such as ISO file from the OS vendor, provides a clean, con‐ sistent starting point for building a server template. The template building process starts by booting a server instance from the OS image and running the automated setup process (such as Red Hat’s Kickstart). The server instance can then be customized before saving an image to use as a template.

The just-enough operating system approach, or JEOS, pares the system image down to the bare essentials. This is mainly intended for building virtual appliances, containers, and embedded systems, but for a highly automated infrastructure, it’s a good idea to consider how far you can strip the OS down.

he process of booting the origin server image as a server instance, applying customizations, and then shutting down the instance to bake the template image can be slow. An alternative is to use a source image that is mountable as a disk volume—for exam‐ ple, an EBS backed AMI in AWS. A longer-running server can mount a copy of the origin image as a disk volume and then make customizations to the files on the image. This may use chroot to make sure that package management tools and other scripts see the image’s relative paths correctly.

Server templates become stale over time as packages fall out of date and configuration improvements are found.

Reheating a Template

Baking a Fresh Template

It should be possible to trace any running server instance back to the template version used to build it.

It’s usually important to clean out older template versions to save storage space. Teams that update templates frequently (e.g., those using immutable servers) will find that this consumes massive amounts of storage if they don’t prune them.

A rule of thumb is to keep the templates that were used to create the servers running in your infrastructure to ensure you can rapidly reproduce the server in a pinch.

Layered templates fit well, conceptually at least, with a change management pipeline

in practice it isn’t always useful. In fact, it can actually make the end-to-end process of making a change and getting the usable template longer.

Automatically building templates leads naturally to automatically testing them. Every time a new template is built, the automation tooling can use it to spin up a new VM, run tests to make sure it’s correct and compliant, and then mark the template as ready for use.

## Chapter 8: Patterns for Updating and Changing servers

Changes to servers should not be allowed outside the automated process. Unman‐ aged changes lead to configuration drift and make it difficult to quickly and reliably reproduce a given server.

Using the term “immutable” to describe this pattern can be misleading. “Immutable” means that a thing can’t be changed, so a truly immutable server would be useless.

It’s more useful to think of the term “immutable” as applying to the server’s configuration, rather than to the server as a whole.

Practice: Minimize Server Templates

Practice: Replace Servers When the Server Template Changes

Pattern: Phoenix Servers

Pattern: Masterless Configuration Management

When using continuous synchronization, it’s important to be aware that the majority of a server will not be managed by the configuration definitions that are applied on every run. As shown in Figure 8-5, configuration definition files can only cover a fraction of the surface area of a server’s configuration.

But these unmanaged areas do leave the door open to configuration drift. If someone finds the need to change the configuration in an unmanaged part of a server, they may be tempted to make it manually rather than going through the hassle of writing a new configuration definition


Teams using immutable servers need more mature server template management because of the need to build new templates quickly and often.

The purest use of immutable servers is to bake everything onto the server template and change nothing, even when creating server instances from the template.

Teams should strive to minimize the size of their codebase.

## Chapter 9: Patterns for Defining Infrastructure

A stack is a collection of infrastructure elements that are defined as a unit (the inspiration for choosing the term stack comes mainly from the term’s use by AWS CloudFormation).

The difficulty of a monolithic definition is that it becomes cumbersome to change.

But in many cases, applying existing patterns will, at best, miss out on opportunities to leverage newer technology to simplify and improve the architecture

Multitier applications can be divided into multiple stacks to allow each tier to be changed independently.

## Chapter 10: Software Engineering practices for Infrastructure

Defining a system as infrastructure as code and building it with tools doesn’t make the quality any better. At worst, it can complicate things. A mess of inconsistent, poorly maintained definition files and tooling can be combined with ad hoc manual interventions and special cases. The result is a fragile infrastructure where running the wrong tool can do catastrophic damage.

Put everything in version control that is needed to build and rebuild elements of your infrastructure.

Passwords and other security secrets should never (never!) be stored in a VCS.

One misconception about CD is that it means every change committed is applied to production immediately after passing automated tests. While some organizations using continuous delivery do take this continuous deployment approach, most don’t. The point of CD is not to apply every change to production immediately, but to ensure that every change is ready to go to production.

It’s a trap to think that removing feature toggles is unnecessary work, or that configuration options should be left in “just in case.” These add complexity, increasing the time to understand the sys‐ tem and debug errors. Defects love to hide in code that people assume isn’t used.

## Chapter 11: Testing Infrastructure changes

High-level tests tend to be brittle.

Higher-level tests are also slower to run than the more focused lower-level tests, which makes it impractical to run the full suite frequently.

It’s important to avoid over-complicating the test suite.

Maintaining an automated test suite can be a burden.

Static code analysis tools are available for a growing number of infrastructure defini‐ tion file formats, like puppet-lint and Foodcritic for Chef.

Most infrastructure tools have some kind of unit testing tool or framework, such as rspec-puppet and ChefSpec. Saltstack even comes with its own built-in unit testing support.

There are a variety of tools that make it easier to automatically create server instances, or other infrastructure context, for the purposes of testing. Test Kitchen is designed to make it easy to manage test servers on different infrastructure platforms in order to apply and test configuration. It was written specifically for Chef but is also used for testing Puppet and other tools. Kitchen Puppet was written to support test‐ ing Puppet manifests with Test Kitchen.

The tooling for writing and running tests should be treated the same as everything else in the infrastructure. Team members need to apply the same time, effort, and discipline to maintaining high-quality test code and systems.

Anti-Pattern: Reflective Tests

As a rule, only write a test when there’s some complexity to the logic that you want to validate. For the configuration file example, it may be worth writing that simple test if there is some complex logic that means the file may or may not be created.

Test doubles can be used to stand in for external services for most testing. Your test suite can first run tests with the system using test doubles.

## Chapter 12: Change management pipelines for Infrastructure

The point of CD and the software deployment pipeline is to allow changes to be delivered in a continuous flow, rather than in large batches.

One objection to making testing environments consistent with production is the expense. In organizations with hundreds or thousands of servers, or very expensive hardware, it’s not practical to duplicate this in each stage of the pipeline, or even in any stage of the pipeline.

Make sure that the essential characteristics are the same.

Replicate enough of the production characteristics so that potential issues will be caught.

The build stage (sometimes called the CI stage) is the first stage triggered after a change is committed to the VCS

The relationship between the test pyramid and a pipeline

Don’t allow work to become bottlenecked by sharing environments or stages.

The final stages in a pipeline is normally the production deployment stage. This should be a trivial task, because it carries out exactly the same activities, using exactly the same tools and processes, as have been applied many times in upstream stages.

Every time you commit to VCS, assume the change could be put through to production if it passes the automated checks. Don’t assume you will be able to finish it off, clean it up, or make any additional edits. So don’t make a change that you would be alarmed to find in production.

If a stage fails, everyone committing changes to components upstream from that stage should stop committing. Otherwise, new changes are piled onto the broken environment, making it difficult to untangle what went wrong.

Emergency fixes should always be made using the pipeline. If the pipeline isn’t fast or reliable enough, then improve it until it is.

The fan-in pattern is a common one, useful for building a system that is composed of multiple components.

A join stage brings the outputs of two or more feeder branches together. When one of the feeder branches runs successfully, it triggers the join stage, which uses the new artifact from the feeder that triggered it.

The longer the pipeline is, the longer it will take changes to run through. Keeping pipelines as short as possible helps to keep changes running through quickly and smoothly.

The design of your change management pipelines is a manifestation of your system’s architecture. Both of these are a manifestation of your team structure.

Organizations can take advantage of this to shape their teams, systems, and pipeline to optimize for the outcomes they want. This is sometimes called the Inverse Conway Maneuver.

One way that one component can provide a capability to another is to work like a library.

Consumer teams can have their pipelines automati‐ cally spin up a service instance to test against, and then tear it down again after the testing stage is finished.

A team that consumes a service provided by another team can include stages in their pipeline that deploy and test integration with a test instance of the provider.

By running contract tests in their own pipeline, the provider team will be alerted if they accidentally make a change that breaks the contract.

## Chapter 13: Workflow for the infrastructure team

Antipattern: Branch-Based Codebases

## Chapter 14: Continuity with Dynamic Infrastructure

Clusters can actually be more fragile in an automated environment,

## Chapter 15: Organizing for Infrastructure as Code

Every IT organization is unhappy with its current architecture. It has grown organically into a spaghetti-shaped mess, burdened with technical debt. Of course, there is a plan to transform to a new world, a beautiful, cleanly designed platform. It will be based on the most up-to-date architectural patterns and principles and will use the latest technologies.

Organizations usually end up in a messy end-state because they take a static view of architecture, rather than an evolutionary view.1

The foundation of evolutionary design and implementation is the ability to make changes continuously, easily, safely, and cheaply. Teams who embrace this approach know that they won’t achieve a perfect “final” design. Anyway, the right design is continually changing. So they become comfortable, and proficient, with continuous change.

The trailblazer pipeline2 is a more evolutionary approach to implementing infrastructure automation. It takes a “depth-first” approach, building a simple, end-to-end change management pipeline. The team starts building a trailblazer pipeline by choosing a single, simple change.

Metrics:
* Cycle time: The time taken from a need being identified to fulfilling it.
* Mean time to recover: The time taken from an availability problem (which includes critically degraded performance or functionality) being identified to a resolution, even where it’s a workaround. 
* Mean time between failures: The time between critical availability issues.
* Availability: The percentage of time that the system is available, usually excluding time the system is offline for planned maintenance. 
* True availability: The percentage of time that the system is available, not excluding planned maintenance.

Retrospectives and blameless post-mortems are important practices to support continuous improvement.