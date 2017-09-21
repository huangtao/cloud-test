.class public Lcom/boyaa/extension/Clipboard;
.super Ljava/lang/Object;
.source "Clipboard.java"


# static fields
.field public static final DICT_NAME:Ljava/lang/String; = "boyaa_clipboard"

.field public static final KEY_TEXT_ID:Ljava/lang/String; = "text"

.field private static clipboardManagerContent:Landroid/content/ClipboardManager;

.field private static clipboardManagerText:Landroid/text/ClipboardManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clean()V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 73
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_1

    .line 74
    sget-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerContent:Landroid/content/ClipboardManager;

    .line 75
    .local v0, "clipboardManager":Landroid/content/ClipboardManager;
    if-eqz v0, :cond_0

    .line 76
    const-string v2, ""

    invoke-static {v4, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    .line 77
    .local v1, "data":Landroid/content/ClipData;
    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 85
    .end local v1    # "data":Landroid/content/ClipData;
    .local v0, "clipboardManager":Landroid/text/ClipboardManager;
    :cond_0
    :goto_0
    return-void

    .line 80
    .end local v0    # "clipboardManager":Landroid/text/ClipboardManager;
    :cond_1
    sget-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerText:Landroid/text/ClipboardManager;

    .line 81
    .restart local v0    # "clipboardManager":Landroid/text/ClipboardManager;
    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0, v4}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public static getText()Ljava/lang/String;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 51
    const-string v3, ""

    .line 53
    .local v3, "text":Ljava/lang/String;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_1

    .line 54
    sget-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerContent:Landroid/content/ClipboardManager;

    .line 55
    .local v0, "clipboardManager":Landroid/content/ClipboardManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 56
    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v1

    .line 57
    .local v1, "data":Landroid/content/ClipData;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    .line 58
    .local v2, "item":Landroid/content/ClipData$Item;
    invoke-virtual {v2}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 66
    .end local v0    # "clipboardManager":Landroid/content/ClipboardManager;
    .end local v1    # "data":Landroid/content/ClipData;
    .end local v2    # "item":Landroid/content/ClipData$Item;
    :cond_0
    :goto_0
    return-object v3

    .line 61
    :cond_1
    sget-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerText:Landroid/text/ClipboardManager;

    .line 62
    .local v0, "clipboardManager":Landroid/text/ClipboardManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/text/ClipboardManager;->hasText()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    invoke-virtual {v0}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static init(Landroid/app/Activity;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 21
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 22
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    sput-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerContent:Landroid/content/ClipboardManager;

    .line 26
    :goto_0
    return-void

    .line 24
    :cond_0
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    sput-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerText:Landroid/text/ClipboardManager;

    goto :goto_0
.end method

.method public static setText(Ljava/lang/String;)V
    .locals 4
    .param p0, "text"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 33
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_1

    .line 34
    sget-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerContent:Landroid/content/ClipboardManager;

    .line 35
    .local v0, "clipboardManager":Landroid/content/ClipboardManager;
    if-eqz v0, :cond_0

    .line 36
    const-string v2, "text"

    invoke-static {v2, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    .line 37
    .local v1, "data":Landroid/content/ClipData;
    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 45
    .end local v0    # "clipboardManager":Landroid/content/ClipboardManager;
    .end local v1    # "data":Landroid/content/ClipData;
    :cond_0
    :goto_0
    return-void

    .line 40
    :cond_1
    sget-object v0, Lcom/boyaa/extension/Clipboard;->clipboardManagerText:Landroid/text/ClipboardManager;

    .line 41
    .local v0, "clipboardManager":Landroid/text/ClipboardManager;
    if-eqz v0, :cond_0

    .line 42
    invoke-virtual {v0, p0}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
