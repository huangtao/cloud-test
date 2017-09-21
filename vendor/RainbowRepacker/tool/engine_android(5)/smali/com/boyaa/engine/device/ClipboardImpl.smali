.class public Lcom/boyaa/engine/device/ClipboardImpl;
.super Ljava/lang/Object;
.source "ClipboardImpl.java"


# static fields
.field private static clipboard:Landroid/content/ClipboardManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/device/ClipboardImpl;->clipboard:Landroid/content/ClipboardManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Init()V
    .locals 2

    .prologue
    .line 14
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    sput-object v0, Lcom/boyaa/engine/device/ClipboardImpl;->clipboard:Landroid/content/ClipboardManager;

    .line 15
    return-void
.end method

.method public static getString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 25
    const-string v4, ""

    .line 26
    .local v4, "str":Ljava/lang/String;
    sget-object v5, Lcom/boyaa/engine/device/ClipboardImpl;->clipboard:Landroid/content/ClipboardManager;

    if-eqz v5, :cond_0

    .line 27
    sget-object v5, Lcom/boyaa/engine/device/ClipboardImpl;->clipboard:Landroid/content/ClipboardManager;

    invoke-virtual {v5}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v3

    .line 28
    .local v3, "primaryClip":Landroid/content/ClipData;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/content/ClipData;->getItemCount()I

    move-result v5

    if-lez v5, :cond_0

    .line 29
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    .line 31
    .local v2, "item":Landroid/content/ClipData$Item;
    :try_start_0
    invoke-virtual {v2}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 32
    .local v1, "charSequence":Ljava/lang/CharSequence;
    if-eqz v1, :cond_0

    .line 33
    instance-of v5, v1, Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 34
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 43
    .end local v1    # "charSequence":Ljava/lang/CharSequence;
    .end local v2    # "item":Landroid/content/ClipData$Item;
    .end local v3    # "primaryClip":Landroid/content/ClipData;
    :cond_0
    :goto_0
    return-object v4

    .line 36
    .restart local v1    # "charSequence":Ljava/lang/CharSequence;
    .restart local v2    # "item":Landroid/content/ClipData$Item;
    .restart local v3    # "primaryClip":Landroid/content/ClipData;
    :cond_1
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_0

    .line 39
    .end local v1    # "charSequence":Ljava/lang/CharSequence;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static setString(Ljava/lang/String;)V
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 18
    sget-object v0, Lcom/boyaa/engine/device/ClipboardImpl;->clipboard:Landroid/content/ClipboardManager;

    if-eqz v0, :cond_0

    .line 19
    sget-object v0, Lcom/boyaa/engine/device/ClipboardImpl;->clipboard:Landroid/content/ClipboardManager;

    const-string v1, ""

    invoke-static {v1, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 21
    :cond_0
    return-void
.end method
