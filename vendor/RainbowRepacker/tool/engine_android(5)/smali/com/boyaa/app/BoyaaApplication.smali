.class public Lcom/boyaa/app/BoyaaApplication;
.super Landroid/support/multidex/MultiDexApplication;
.source "BoyaaApplication.java"


# static fields
.field public static isDebug:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/support/multidex/MultiDexApplication;-><init>()V

    return-void
.end method

.method private isDebuggable(Landroid/content/Context;)Z
    .locals 2
    .param p1, "cxt"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 28
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    sput-boolean v1, Lcom/boyaa/app/BoyaaApplication;->isDebug:Z

    .line 29
    sget-boolean v1, Lcom/boyaa/app/BoyaaApplication;->isDebug:Z

    return v1

    .line 28
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    .prologue
    .line 15
    invoke-super {p0}, Landroid/support/multidex/MultiDexApplication;->onCreate()V

    .line 17
    invoke-virtual {p0}, Lcom/boyaa/app/BoyaaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/boyaa/app/BoyaaApplication;->isDebuggable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 18
    new-instance v0, Lcom/boyaa/app/debug/CrashHandler;

    invoke-virtual {p0}, Lcom/boyaa/app/BoyaaApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/boyaa/app/debug/CrashHandler;-><init>(Landroid/content/Context;)V

    .line 19
    .local v0, "ch":Lcom/boyaa/app/debug/CrashHandler;
    invoke-virtual {v0}, Lcom/boyaa/app/debug/CrashHandler;->register()V

    .line 21
    .end local v0    # "ch":Lcom/boyaa/app/debug/CrashHandler;
    :cond_0
    return-void
.end method
