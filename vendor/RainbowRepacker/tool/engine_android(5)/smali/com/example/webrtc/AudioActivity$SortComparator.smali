.class public Lcom/example/webrtc/AudioActivity$SortComparator;
.super Ljava/lang/Object;
.source "AudioActivity.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/webrtc/AudioActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SortComparator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/webrtc/AudioActivity;


# direct methods
.method public constructor <init>(Lcom/example/webrtc/AudioActivity;)V
    .locals 0

    .prologue
    .line 666
    iput-object p1, p0, Lcom/example/webrtc/AudioActivity$SortComparator;->this$0:Lcom/example/webrtc/AudioActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;

    .prologue
    .line 669
    move-object v0, p1

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    .local v0, "a":Lcom/example/webrtc/UserChannelBean;
    move-object v1, p2

    .line 670
    check-cast v1, Lcom/example/webrtc/UserChannelBean;

    .line 672
    .local v1, "b":Lcom/example/webrtc/UserChannelBean;
    iget v2, v1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    iget v3, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    if-le v2, v3, :cond_0

    .line 673
    const/4 v2, -0x1

    .line 675
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method
