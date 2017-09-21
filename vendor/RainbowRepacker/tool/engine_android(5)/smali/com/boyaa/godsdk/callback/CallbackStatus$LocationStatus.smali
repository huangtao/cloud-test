.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$LocationStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/callback/CallbackStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "LocationStatus"
.end annotation


# static fields
.field public static final LOCATION_STATUS_START:I = 0x15f90

.field public static final RESULT_CODE_UnknownError:I = 0x16058

.field public static final RESULT_CODE_failed:I = 0x15ff5

.field public static final RESULT_CODE_success:I = 0x15ff4


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 304
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$LocationStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
